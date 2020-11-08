import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sporttt/ui/tab_owner.dart';

class TabAddPitch extends StatefulWidget {
  @override
  _TabPitch createState() => _TabPitch();
}

class _TabPitch extends State<TabAddPitch> {
  double get radius => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Thêm sân mới'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Column(
          children: [
            _buildRow("Tên"),
            SizedBox(
              height: 20,
            ),
            _buildRow("Địa chỉ"),
            SizedBox(
              height: 20,
            ),
            _buildRow('Giá'),
            SizedBox(
              height: 20,
            ),
            _buildRow("Liên hệ"),
            SizedBox(
              height: 20,
            ),
            _buildRow("Ghi chú"),
            SizedBox(
              height: 20,
            ),
            addPitch(),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title) {
    return Row(children: [
      Expanded(
        child: Text(title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
        flex: 2,
      ),
      Expanded(
        child: Neumorphic(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              hintText: '',
            ),
          ),
        ),
        flex: 5,
      ),
    ]);
  }

  Widget addPitch() {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
        depth: 8,
        color: Colors.green[200],
        // lightSource: LightSource.topLeft,
      ),
      child: NeumorphicButton(
        style: NeumorphicStyle(color: Colors.green[200]),
        child: Text(
          'THÊM SÂN',
          style: TextStyle(fontSize: 20),
        ),
        // color: Colors.lightGreen,
        onPressed: () {
          setState(() {
            Fluttertoast.showToast(
                msg: "Thêm sân thành công",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => PitchManagement(),
              ),
            );
          });
        },
      ),
    );
  }
}
