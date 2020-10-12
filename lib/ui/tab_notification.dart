import 'package:flutter/material.dart';

class TabNotificationScreen extends StatefulWidget {
  @override
  _TabNotificationScreenState createState() => _TabNotificationScreenState();
}

class _TabNotificationScreenState extends State<TabNotificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Text> a = new List();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.lightBlueAccent,
          title: Text('Thông báo'),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    _buildMessage(),
                    _buildMessage(isRead: false),
                    _buildMessage(),
                    _buildMessage(isRead: false),
                    _buildMessage(),
                    _buildMessage(),
                    _buildMessage(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    _buildMessage(
                      showMore: true,
                    ),
                    _buildMessage(
                      isRead: false,
                      showMore: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessage({
    bool isRead: true,
    bool showMore: false,
  }) {
    return Container(
      color: isRead ? Colors.white : Colors.black12,
      width: double.maxFinite,
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                child: Text("NM"),
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Thông báo từ CLB',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bạn đã tham gia CLB thành công'),
                Text(
                  'Thứ Ba, 14:45',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            flex: 7,
          ),
          Expanded(
            child: showMore ? Icon(Icons.more_vert) : Container(),
            flex: 1,
          )
        ],
      ),
    );
  }
}
