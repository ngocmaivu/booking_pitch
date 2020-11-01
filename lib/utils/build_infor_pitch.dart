import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sporttt/ui/tab_booking_pitch.dart';
import 'package:intl/intl.dart';

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
        margin: EdgeInsets.all(16),
        style: NeumorphicStyle(
          // shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          depth: 8,
          lightSource: LightSource.topLeft,
          // border: NeumorphicBorder(width: 1, color: Colors.black)
        ),

        child: Column(
          children: [
            Neumorphic(
              margin: EdgeInsets.all(10),
              // style: NeumorphicStyle(
              // border: NeumorphicBorder(width: 1, color: Colors.black)),
              child: Container(
                  width: 250,
                  height: 77,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: Image.network(image).image,
                    fit: BoxFit.cover,
                  ))),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: NeumorphicText(
                this.namePitch,
                style: NeumorphicStyle(
                  depth: 10,
                  color: Colors.black,
                ),
                textStyle: NeumorphicTextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(children: [
              Icon(
                Icons.location_on,
                color: Colors.green[700],
              ),
              NeumorphicText(
                this.address + ' ~ ' + local.toString() + 'km',
                style: NeumorphicStyle(
                  depth: 10,
                  color: Colors.black,
                ),
                textStyle: NeumorphicTextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ]),
            if (price <= promotion)
              Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.green[800],
                  ),
                  Text(
                    oCcy.format(this.price).toString() + ' VND/h',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            if (price > promotion)
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.green[800],
                      ),
                      Text(
                        oCcy.format(this.price).toString() + ' VND/h',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                      ),
                      Text(
                        oCcy.format(this.price).toString() + ' VND/h',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ],
              ),
            Row(
              children: [
                Text(
                  rate.toString(),
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
