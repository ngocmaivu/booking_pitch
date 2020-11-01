import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TabFindCompetitor extends StatefulWidget {
  @override
  _TabFindCompetitor createState() => _TabFindCompetitor();
}

String changedText = 'Tham gia';
String changedText1 = 'Tham gia';

class _TabFindCompetitor extends State<TabFindCompetitor> {
  double get radius => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: NeumorphicAppBar(
            title: Text('Trận đấu'),
            actions: [
              NeumorphicButton(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
                  depth: 8,
                  // lightSource: LightSource.bottomRight,
                ),
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          body: Container(
            child: Column(
              children: [
                _buildSearchTextField(),
                _buildCompertitor(),
                _buildCompertitor(),
              ],
            ),
          ),
        ));
  }

  Widget _buildCompertitor() {
    return Neumorphic(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
          depth: 3,
          color: Colors.white,
          // lightSource: LightSource.topLeft,
        ),
        child: Row(
          children: [
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
                    "FPT",
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
                    'Giao hữu tại quận 9',
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
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.lightGreen,
                      ),
                      Text(
                        'Thứ Tư, 14:45 - 12/11/2020',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              flex: 4,
            ),
            Expanded(
                child: NeumorphicButton(
                  // color: Colors.white38,
                  onPressed: () {
                    setState(() {
                      changedText = 'Chờ chấp thuận';
                    });
                  },
                  child: Container(
                    child: Text('${changedText}',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                  ),
                ),
                flex: 2)
          ],
        ));
  }

  Widget _buildSearchTextField() {
    return Neumorphic(
      margin: EdgeInsets.all(11),
      padding: EdgeInsets.only(left: 30, top: 5, bottom: 5),
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
        depth: 8,
        color: Colors.grey[100],
        // lightSource: LightSource.topLeft,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Nhập tên đội...',
          suffixIcon: Icon(
            Icons.search_rounded,
            color: Colors.green[200],
            size: 30,
          ),
        ),
      ),
    );
  }
}
