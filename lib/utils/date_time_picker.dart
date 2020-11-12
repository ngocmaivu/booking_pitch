import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if ((picked != null && picked.compareTo(selectedDate) != -1))
      setState(() {
        selectedDate = picked;
      });
    else {
      Fluttertoast.showToast(
          msg: "Ngày không hợp lệ",
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      selectedDate = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        depth: 2,
        border: NeumorphicBorder(width: 1),
      ),
      onPressed: () => _selectDate(context),

      // minDistance: 250,
      child: Text(
        "${selectedDate.toLocal()}".split(' ')[0],
        style: TextStyle(
          color: Colors.black,
          fontSize: 19,
        ),
        textWidthBasis: TextWidthBasis.longestLine,
      ),
    );
  }
}
