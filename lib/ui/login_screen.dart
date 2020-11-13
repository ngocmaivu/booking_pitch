import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sporttt/bloc/admin.dart';
import 'package:sporttt/bloc/user.dart';
import 'package:sporttt/ui/owner_screen.dart';
import 'package:sporttt/ui/tab_forgot_password.dart';
import 'package:sporttt/ui/tab_regist.dart';

import 'home_screen.dart';

// This widget is the root of your application.

class LognPage extends StatefulWidget {
  @override
  _LognPageState createState() => _LognPageState();
}

class _LognPageState extends State<LognPage> {
  String phoneNumber, password;
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
        )
      ],
    );
  }

  Widget _buildPhoneNumberRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            phoneNumber = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.drive_file_rename_outline,
              color: Colors.green,
            ),
            labelText: 'Tên đăng nhập'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.green,
            ),
            labelText: 'Mật khẩu'),
      ),
    );
  }

//role admin = 2, user = 1
  int checkLogin() {
    int result = -1;
    LIST_USER.forEach((element) {
      if (element.username == phoneNumber) {
        print('user');
        result = 1;
      }
    });
    LIST_ADMIN.forEach((element) {
      if (element.admin == phoneNumber) {
        print('admin');
        result = 2;
      }
    });
    return result;
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 25),
          width: 5 * (MediaQuery.of(context).size.width / 15),
          margin: EdgeInsets.only(bottom: 10, left: 3, right: 3),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (checkLogin() == 1) {
                Navigator.of(context).pushReplacement(CupertinoPageRoute(
                  builder: (context) => HomeScreen(),
                ));
                LIST_USER.add(User(username: 'a', password: 'a'));
                print(LIST_USER.toString());
              } else if (checkLogin() == 2) {
                Navigator.of(context).pushReplacement(CupertinoPageRoute(
                  builder: (context) => OwnerScreen(),
                ));
              }
            },
            child: Text(
              "Đăng nhập",
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

  Widget _buildRegisButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 25),
          width: 5 * (MediaQuery.of(context).size.width / 15),
          margin: EdgeInsets.only(bottom: 10, right: 2, left: 3),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Regist(),
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

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Đăng nhập",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _buildPhoneNumberRow(),
                _buildPasswordRow(),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ForgotPassword(),
                      )),
                  child: Text(
                    "Quên mật khẩu?",
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    _buildLoginButton(),
                    _buildRegisButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            alignment: Alignment.topCenter,
            child: Text(
              'ĐẶT SÂN BÓNG ĐÁ',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 25,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // _buildLogo(),
              SizedBox(
                height: 20,
              ),
              _buildContainer(),
            ],
          )
        ],
      ),
    ));
  }
}
