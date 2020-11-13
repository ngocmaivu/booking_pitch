import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'login_screen.dart';

class Regist extends StatefulWidget {
  @override
  _Regist createState() => _Regist();
}

int _value = 1;

class _Regist extends State<Regist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NeumorphicAppBar(
          title: Text('Đăng kí'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintText: 'Nhập email',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintText: 'Tên đăng nhập',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintText: 'Nhập Password',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintText: 'Nhập lại Password',
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      _buildTypeOfPitch(),
                      _buildRegisButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildTypeOfPitch() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Bạn là ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            flex: 2,
          ),
          Expanded(
            child: Neumorphic(
              padding: EdgeInsets.only(left: 10),
              // margin: EdgeInsets.only(
              //   right: 32,
              // ),
              style: NeumorphicStyle(
                depth: 20,
                intensity: 1,
                border: NeumorphicBorder(width: 1),
              ),
              child: DropdownButtonFormField(
                autofocus: true,
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Chủ Sân",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Người đặt sân",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: 2,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildRegisButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 25),
          width: 5 * (MediaQuery.of(context).size.width / 15),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => LognPage(),
                  ));
            },
            child: Text(
              "Đăng kí",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 60,
              ),
            ),
          ),
        )
      ],
    );
  }
}
