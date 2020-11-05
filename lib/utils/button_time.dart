import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TimeButton extends StatefulWidget {
  int time;
  bool booked;
  TimeButton({this.booked, this.time});
  @override
  _TimeButtonState createState() =>
      _TimeButtonState(time: time, booked: booked);
}

class _TimeButtonState extends State<TimeButton> {
  int time;
  bool booked;
  _TimeButtonState({this.time, this.booked});
  Color buttonColor = Colors.white;
  bool _isSelect;
  double depth;
  @override
  void initState() {
    // TODO: implement initState
    _isSelect = false;
    depth = 20;
    if (booked) {
      buttonColor = Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        setState(() {
          _isSelect = !_isSelect;
          if (_isSelect) {
            buttonColor = Colors.greenAccent;
            depth = -20;
          } else {
            buttonColor = Colors.white;
            depth = 20;
          }
        });
      },
      style: NeumorphicStyle(
        depth: depth,
        intensity: 1,
        lightSource: LightSource.topLeft,
      ),
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: buttonColor,
        child: Text(
          time.toString() + 'h',
          style: TextStyle(
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
