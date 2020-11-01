import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TabNotificationScreen extends StatefulWidget {
  @override
  _TabNotificationScreenState createState() => _TabNotificationScreenState();
}

class _TabNotificationScreenState extends State<TabNotificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Text> a = new List();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: NeumorphicAppBar(
          title: Text('Thông báo'),
        ),
        body: SafeArea(
          child: Column(children: [
            _buildMessage(),
            _buildMessage(),
            _buildMessage(),
          ]),
        ),
      ),
    );
  }

  Widget _buildMessage() {
    return Neumorphic(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
          depth: 3,
          color: Colors.white,
          // lightSource: LightSource.topLeft,
        ),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape: NeumorphicBoxShape.circle(),
                depth: 2,
                color: Colors.grey[100],
                // lightSource: LightSource.topLeft,
              ),
              child: CircleAvatar(
                child: Text(
                  "",
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.orange[200],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Bạn đã đặt sân thành công',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.lightGreen,
                    ),
                    Text('Sân bóng đá mini quận 9'),
                  ],
                ),
              ],
            ),
            flex: 4,
          ),
        ]));
  }
}
