import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sporttt/bloc/booked_pitch.dart';

class TimeButton extends StatefulWidget {
  int id;
  int time;
  bool booked;
  int count = 0;
  TimeButton({
    this.booked,
    this.time,
  });
  @override
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  Color buttonColor = Colors.yellow[100];
  bool _isSelect;
  double depth;
  @override
  void initState() {
    // TODO: implement initState
    _isSelect = false;
    depth = 20;
    if (widget.booked) {
      buttonColor = Colors.red;
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
            LIST_BOOKED[0].count++;
            if (LIST_BOOKED[0].count == 1) {
              LIST_BOOKED[0].timeFrom = widget.time;
              LIST_BOOKED[0].timeTo = widget.time + 1;
            }
            if (LIST_BOOKED[0].count > 1 &&
                widget.time == LIST_BOOKED[0].timeTo) {
              LIST_BOOKED[0].timeTo = widget.time + 1;
            }
            if (LIST_BOOKED[0].count > 1 &&
                widget.time == LIST_BOOKED[0].timeFrom - 1) {
              LIST_BOOKED[0].timeFrom = widget.time;
            }
            if (widget.time < LIST_BOOKED[0].timeFrom - 1 ||
                widget.time > LIST_BOOKED[0].timeTo) {
              LIST_BOOKED[0].count--;
              buttonColor = Colors.yellow[100];
              depth = 20;
            }
          } else if (!_isSelect && !widget.booked) {
            buttonColor = Colors.yellow[100];
            depth = 20;
            LIST_BOOKED[0].count--;
            if (LIST_BOOKED[0].count <= 0) {
              LIST_BOOKED[0].timeFrom = 0;
              LIST_BOOKED[0].timeTo = 0;
            }
            if (widget.time == LIST_BOOKED[0].timeFrom) {
              LIST_BOOKED[0].timeFrom = widget.time + 1;
            }
            if ((widget.time + 1) == LIST_BOOKED[0].timeTo) {
              LIST_BOOKED[0].timeTo = widget.time;
            }
            if ((widget.time > LIST_BOOKED[0].timeFrom) &&
                (widget.time < LIST_BOOKED[0].timeTo)) {
              LIST_BOOKED[0].count++;
              buttonColor = Colors.greenAccent;
              depth = -20;
            }
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
          widget.time.toString() + 'h - ' + (widget.time + 1).toString() + 'h',
          style: TextStyle(
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
