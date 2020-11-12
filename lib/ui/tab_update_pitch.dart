import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sporttt/bloc/pitch_infor.dart';
import 'package:sporttt/ui/tab_owner.dart';

class TabUpdatePitch extends StatefulWidget {
  @override
  _TabUpdatePitch createState() => _TabUpdatePitch();
}

class _TabUpdatePitch extends State<TabUpdatePitch> {
  double get radius => null;
  int _value = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Cập nhật thông tin sân'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Column(
          children: [
            _buildRow("Tên", LIST_PITCH[0].namePitch),
            _selectImg(),
            _buildRow("Địa chỉ", LIST_PITCH[0].address),
            _buildTypeOfPitch(),
            _buildRow('Giá', LIST_PITCH[0].price.toString()),
            addPitch(),
          ],
        ),
      ),
    );
  }

  Widget _selectImg() {
    return Container(
      width: 500,
      margin: EdgeInsets.only(left: 97, right: 10, top: 2),
      child: RaisedButton(
        child: Text('Chọn lại hình ảnh'),
        onPressed: () {},
      ),
    );
  }

  Widget _buildTypeOfPitch() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Loại sân",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            flex: 2,
          ),
          Expanded(
            child: Neumorphic(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(
                right: 10,
              ),
              style: NeumorphicStyle(
                color: Colors.white,
                depth: 2,
                border: NeumorphicBorder(width: 1),
              ),
              child: DropdownButtonFormField(
                autofocus: true,
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Sân 5 người",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Sân 7 người",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Sân 11 người",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: 3,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
            flex: 7,
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String infor) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 10, left: 10),
      child: Row(children: [
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
            style: NeumorphicStyle(
              color: Colors.white,
              depth: 0,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                hintText: infor,
              ),
            ),
          ),
          flex: 7,
        ),
      ]),
    );
  }

  Widget addPitch() {
    return Neumorphic(
      margin: EdgeInsets.only(top: 20),
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
        depth: 1,
        color: Colors.green[200],
        // lightSource: LightSource.topLeft,
      ),
      child: NeumorphicButton(
        style: NeumorphicStyle(color: Colors.green),
        child: Text(
          'CẬP NHẬT',
          style: TextStyle(fontSize: 20),
        ),
        // color: Colors.lightGreen,
        onPressed: () {
          setState(() {
            Fluttertoast.showToast(
                msg: "Cập nhật đang chờ phê duyệt",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pop(
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
