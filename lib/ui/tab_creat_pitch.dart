import 'package:file_picker/file_picker.dart';
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
  int _value = 1;
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
            _selectImg(),
            _buildRow("Địa chỉ"),
            _buildTypeOfPitch(),
            _buildRow('Giá'),
            _buildRow("Liên hệ"),
            _buildRow("Ghi chú"),
            addPitch(),
          ],
        ),
      ),
    );
  }

  Widget _selectImg() {
    return Container(
      width: 500,
      margin: EdgeInsets.only(left: 100, right: 10),
      child: RaisedButton(
        child: Text('Chọn hình ảnh'),
        onPressed: () {},
      ),
    );
  }

  Widget _buildTypeOfPitch() {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10),
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
                      textAlign: TextAlign.center,
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
                    // price = listPrice[_value - 1];
                    // LIST_BOOKED[0].price = price;
                    // if (_value == 1) LIST_BOOKED[0].type = 5;
                    // if (_value == 2) LIST_BOOKED[0].type = 7;
                    // if (_value == 3) LIST_BOOKED[0].type = 11;
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

  Widget _buildRow(String title) {
    return Container(
      margin: EdgeInsets.all(10),
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
                hintText: '',
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
