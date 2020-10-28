import 'package:flutter/material.dart';
import 'package:sporttt/bloc/pitch.dart';
import 'package:sporttt/ui/tab_pitch_detail.dart';
import 'package:sporttt/utils/build_group_title.dart';
import 'package:sporttt/utils/build_infor_pitch.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TabHomeScreen extends StatefulWidget {
  @override
  _TabHomeScreenState createState() => _TabHomeScreenState();
}

class _TabHomeScreenState extends State<TabHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        // elevation: 0,
        title: Text('Trang chủ'),
        // actions: <Widget>[
        //   Container(
        //     width: 50,
        //     child: PopupMenuButton(
        //       icon: CircleAvatar(
        //         backgroundImage:
        //             NetworkImage("https://i.imgur.com/zismATK.png"),
        //         backgroundColor: Colors.amberAccent,
        //       ),
        //       itemBuilder: (BuildContext context) {
        //         return [
        //           // PopupMenuItem<String>(
        //           //   value: '1',
        //           //   child: Text('1'),
        //           // ),
        //           // PopupMenuItem<String>(
        //           //   value: '2',
        //           //   child: Text('2'),
        //           // ),
        //         ];
        //       },
        //     ),
        //   )
        // ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // GestureDetector(
            GestureDetector(
              child: SafeArea(
                child: SingleChildScrollView(
                  // controller: _scrollController,
                  child: Column(
                    children: [
                      _buildSearchTextField(),
                      SizedBox(
                        height: 8,
                      ),
                      _buildIcons(),
                      BuildGroupTitle(
                        title: 'Sân quanh đây',
                        isShowAll: true,
                      ),
                      Container(
                        height: 250,
                        child: ListView.builder(
                          itemBuilder: (context, index) => Pitch(
                            namePitch: LIST_PITCH[index].name,
                            address: 'Quận 9',
                            price: 100000,
                            promotion: 90000,
                            rate: 4.1,
                            local: 4.5,
                          ),
                          itemCount: LIST_PITCH.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      BuildGroupTitle(
                        title: 'Đang khuyến mãi',
                        isShowAll: true,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Pitch(
                              namePitch: 'Sân bóng Tiến Phát',
                              address: 'Quận 9',
                              price: 100000,
                              promotion: 90000,
                              rate: 4.1,
                              local: 4.5,
                            ),
                            Pitch(
                              namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                              address: 'Phú Nhuận',
                              price: 100000,
                              promotion: 90000,
                              rate: 4.5,
                              local: 10.2,
                            ),
                            Pitch(
                              namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                              address: 'Phú Nhuận',
                              price: 100000,
                              promotion: 90000,
                              rate: 4.5,
                              local: 10.2,
                            ),
                            Pitch(
                              namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                              address: 'Phú Nhuận',
                              price: 100000,
                              promotion: 90000,
                              rate: 4.5,
                              local: 10.2,
                            ),
                          ],
                        ),
                      ),
                      BuildGroupTitle(
                        title: 'Sân được đánh giá cao',
                        isShowAll: true,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Pitch(
                              namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                              address: 'Phú Nhuận',
                              price: 100000,
                              promotion: 0,
                              rate: 4.5,
                              local: 10.2,
                            ),
                            Pitch(
                              namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                              address: 'Phú Nhuận',
                              price: 100000,
                              promotion: 0,
                              rate: 4.5,
                              local: 10.2,
                            ),
                            Pitch(
                              namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                              address: 'Phú Nhuận',
                              price: 100000,
                              promotion: 0,
                              rate: 4.5,
                              local: 10.2,
                            ),
                            Pitch(
                              namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                              address: 'Phú Nhuận',
                              price: 100000,
                              promotion: 0,
                              rate: 4.5,
                              local: 10.2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                height: 40,
                // color: Colors.green,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return NeumorphicButton(
      padding: const EdgeInsets.fromLTRB(14, 15, 14, 30),
      // style: NeumorphicStyle(
      //   border: NeumorphicBorder(
      //     color: Color(0xfffffcfc),
      //     width: 0.8,
      //     isEnabled: true,
      //   ),
      //   // boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(72)),
      // ),
      child: Text(
        "Nhập tên sân",
      ),
    );
  }

  Widget _buildIcons() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: [
          SizedBox(
            width: 24,
          ),
          CircleAvatar(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.lightGreen,
            maxRadius: 30,
          ),
          SizedBox(
            width: 40,
          ),
          CircleAvatar(
            child: Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            backgroundColor: Colors.lightGreen,
            maxRadius: 30,
          ),
          SizedBox(
            width: 40,
          ),
          CircleAvatar(
            child: Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            backgroundColor: Colors.lightGreen,
            maxRadius: 30,
          ),
          SizedBox(
            width: 40,
          ),
          CircleAvatar(
            child: Icon(
              Icons.more_time,
              color: Colors.white,
            ),
            backgroundColor: Colors.lightGreen,
            maxRadius: 30,
          ),
        ],
      ),
    );
  }
}
