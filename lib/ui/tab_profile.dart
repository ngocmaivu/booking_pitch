import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class TabProfileScreen extends StatefulWidget {
  @override
  _TabProfileScreenState createState() => _TabProfileScreenState();
}

class _TabProfileScreenState extends State<TabProfileScreen> {
  double deviceWidth;
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    width: deviceWidth,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://i.imgur.com/zismATK.png"),
                              backgroundColor: Colors.lightGreen,
                              radius: 50,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ngọc Mai Vũ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                                Text(
                                  'FPT Football Club',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _buildButton(
                    title: 'Chỉnh sửa thông tin cá nhân',
                    iconData: Icons.edit,
                  ),
                  _buildButton(
                    title: 'Trận đấu sắp tới',
                    iconData: Icons.developer_board,
                  ),
                  _buildButton(
                    title: 'Lịch sử',
                    iconData: Icons.history,
                  ),
                  _buildButton(
                    title: 'Đăng xuất',
                    iconData: Icons.assignment_return,
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => LognPage(),
                          ));
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _buildButton(
                    title: 'Giới thiệu',
                  ),
                  _buildButton(
                    title: 'Hỗ trợ',
                    iconData: Icons.settings_input_svideo,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _buildButton(
                    title: 'Cài đặt',
                    iconData: Icons.settings,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButton({
    IconData iconData,
    String title,
    Function function,
  }) {
    return InkWell(
      onTap: function,
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListTile(
          leading: Icon(
            iconData,
          ),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        // shape: Border.all(color: Colors.black),
      ),
    );
  }
}
