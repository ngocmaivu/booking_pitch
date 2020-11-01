import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BuildGroupTitle extends StatelessWidget {
  const BuildGroupTitle({
    Key key,
    @required this.title,
    @required this.isShowAll,
    this.function,
  }) : super(key: key);

  final String title;
  final bool isShowAll;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
      ),
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NeumorphicText(
            this.title,
            style: NeumorphicStyle(
              depth: 10,
              color: Colors.black,
            ),
            textStyle:
                NeumorphicTextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          isShowAll
              ? Text(
                  'Tất cả',
                  style: TextStyle(fontSize: 20, color: Colors.green[800]),
                )
              : Container(),
        ],
      ),
    );
  }
}
