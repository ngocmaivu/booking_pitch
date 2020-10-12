import 'dart:html';

import 'package:flutter/material.dart';

class Pitch extends StatelessWidget {
  const Pitch({
    Key key,
    @required this.namePitch,
    @required this.address,
    @required this.price,
    @required this.rate,
    @required this.local,
  }) : super(key: key);

  final String namePitch;
  final String address;
  final int price;
  final double rate;
  final double local;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(
        left: 16,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Container(
              height: 100,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              this.namePitch,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(this.address + ' ~ ' + local.toString() + 'km'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 0,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text('Giá'),
                  backgroundColor: Colors.white,
                  radius: 14,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(this.price.toString() + ' VND'),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Row(
                children: [
                  Text('Đánh giá: ' + this.rate.toString()),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(
                left: 8,
                bottom: 8,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.access_alarm,
                    color: Colors.red,
                  ),
                  Text('9:00 - 22:00'),
                ],
              )),
        ],
      ),
    );
  }
}
