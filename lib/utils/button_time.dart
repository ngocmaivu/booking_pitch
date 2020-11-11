import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TimeButton extends StatefulWidget {
  int id;
  int time;
  bool booked;
  String service;
  String text;
  TimeButton({
    this.booked,
    this.time,
  });
  @override
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  Color buttonColor = Colors.white;
  bool _isSelect;
  double depth;
  @override
  void initState() {
    // TODO: implement initState
    _isSelect = false;
    depth = 20;
    // if (widget.time == 0)
    //   widget.text = widget.service;
    // else
    widget.text = widget.time.toString() + 'h';
    if (widget.booked) {
      buttonColor = Colors.grey;
      depth = -20;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        setState(() {
          _isSelect = !_isSelect;
          if (_isSelect && !widget.booked) {
            buttonColor = Colors.greenAccent;
            depth = -20;
          } else if (!_isSelect && !widget.booked) {
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
          widget.time.toString() + 'h',
          style: TextStyle(
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
