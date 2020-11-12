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
      margin: EdgeInsets.fromLTRB(15, 15, 5, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NeumorphicText(
            this.title,
            style: NeumorphicStyle(
              depth: 0,
              color: Colors.black,
            ),
            textStyle:
                NeumorphicTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          isShowAll
              ? Text(
                  'Tất cả',
                  style: TextStyle(fontSize: 18, color: Colors.green[800]),
                )
              : Container(),
        ],
      ),
    );
  }
}
