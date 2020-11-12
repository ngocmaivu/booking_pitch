import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sporttt/ui/tab_booking_pitch.dart';
import 'package:intl/intl.dart';
import 'package:sporttt/ui/tab_pitch_detail.dart';

class Pitch extends StatelessWidget {
  Pitch({
    Key key,
    @required this.namePitch,
    @required this.address,
    @required this.price,
    @required this.rate,
    @required this.local,
    @required this.promotion,
    this.image,
    this.function,
  }) : super(key: key);

  final Function function;
  final String namePitch;
  final String address;
  final int price;
  final double rate;
  final double local;
  final int promotion;
  final String image;
  final NumberFormat oCcy = new NumberFormat("#,##0.0", "en_US");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookingPitch(),
      )),
      child: Neumorphic(
        // width: 252,
        margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          depth: 0,
          border: NeumorphicBorder(width: 1),
          lightSource: LightSource.topLeft,
          color: Colors.white,
        ),

        child: Column(
          children: [
            Neumorphic(
              margin: EdgeInsets.all(10),
              child: Container(
                width: 170,
                height: 77,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(image).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              style: NeumorphicStyle(
                depth: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: NeumorphicText(
                this.namePitch,
                style: NeumorphicStyle(
                  depth: 0,
                  color: Colors.black,
                ),
                textStyle: NeumorphicTextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Row(children: [
              Icon(
                Icons.location_on,
                color: Colors.red[700],
              ),
              NeumorphicText(
                this.address + ' ~ ' + local.toString() + 'km',
                style: NeumorphicStyle(
                  depth: 0,
                  color: Colors.black,
                ),
                textStyle: NeumorphicTextStyle(fontSize: 13),
              ),
            ]),
            if (promotion == 0)
              Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.yellow[900],
                  ),
                  Text(
                    oCcy.format(this.price).toString() + ' VND/h',
                  ),
                ],
              ),
            if (price > promotion && promotion != 0)
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        oCcy.format(this.price).toString() + ' VND/h',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        color: Colors.red[900],
                      ),
                      Text(
                        oCcy.format(this.promotion).toString() + ' VND/h',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            Row(
              children: [
                Text(
                  rate.toString(),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
