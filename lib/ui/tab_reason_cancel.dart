import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sporttt/ui/tab_mana_booked_pitch_admin.dart';

import 'login_screen.dart';

class ReasonCancel extends StatefulWidget {
  @override
  _ReasonCancel createState() => _ReasonCancel();
}

int _value1 = 1;

class _ReasonCancel extends State<ReasonCancel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        hintText: 'Lý do hủy',
                      ),
                    ),
                    _buildExReason(),
                    _buildSendButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExReason() {
    return Container(
      margin: EdgeInsets.only(bottom: 30, top: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Đề cử",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            flex: 1,
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
                value: _value1,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Sân đã được đặt trực tiếp",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Sân đang được trùng tu",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Đã có người đặt sớm hơn",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: 3,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _value1 = value;
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

  Widget _buildSendButton() {
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
                  builder: (context) => BookingPitchManagement(),
                ),
              );
            },
            child: Text(
              "Gửi",
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
