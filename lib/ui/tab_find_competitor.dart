import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TabFindCompetitor extends StatefulWidget {
  @override
  _TabFindCompetitor createState() => _TabFindCompetitor();
}

String changedText = 'Hủy đặt';
String changedText1 = 'Hủy đặt';

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
            title: Text('Sân đã đặt'),
            // actions: [
            //   NeumorphicButton(
            //     style: NeumorphicStyle(
            //       shape: NeumorphicShape.concave,
            //       boxShape:
            //           NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
            //       depth: 8,
            //       // lightSource: LightSource.bottomRight,
            //     ),
            //     onPressed: () {},
            //     child: Icon(
            //       Icons.add,
            //       color: Colors.grey,
            //     ),
            //   )
            // ],
          ),
          body: Container(
            child: Column(
              children: [
                // _buildSearchTextField(),
                _buildCompertitor(),
                // _buildCompertitor(),
              ],
            ),
          ),
        ));
  }

  bool isBooked = true;
  Widget _buildCompertitor() {
    return isBooked
        ? Neumorphic(
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
                        'Sân bóng 5 người Hải Âu',
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
                          Text('Hiệp Phú - Quận 9'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.lightGreen,
                          ),
                          Text(
                            '13h - 15h ngày 12/11/2020',
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
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        // setState(() {
                        //   changedText = 'Đã hủy';
                        // });
                        _showBookerInfor();
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.redAccent,
                        child: Text(
                          '${changedText}',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    flex: 2)
              ],
            ))
        : Center(
            // padding: EdgeInsets.,
            child: Text(
              'Chưa có sân nào đã được đặt!',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
  }

  _showBookerInfor() {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Bạn có chắc muốn hủy sân?'),
          // content: Text('Bạn c'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Xác nhận'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isBooked = false;
                });
              },
            ),
          ],
        );
      },
    );
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
