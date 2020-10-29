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
                            promotion: 0,
                            rate: 4.1,
                            local: 4.5,
                            image: "https://i.imgur.com/tpOU8bp.jpg",
                          ),
                          itemCount: LIST_PITCH.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      BuildGroupTitle(
                        title: 'Đang khuyến mãi',
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
                            image: "https://i.imgur.com/tpOU8bp.jpg",
                          ),
                          itemCount: LIST_PITCH.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      BuildGroupTitle(
                        title: 'Sân được đánh giá cao',
                        isShowAll: true,
                      ),
                      Container(
                        height: 250,
                        child: ListView.builder(
                          itemBuilder: (context, index) => Pitch(
                            namePitch: LIST_PITCH[index].name,
                            address: 'Quận 9',
                            price: 100000,
                            promotion: 0,
                            rate: 4.1,
                            local: 4.5,
                            image: "https://i.imgur.com/tpOU8bp.jpg",
                          ),
                          itemCount: LIST_PITCH.length,
                          scrollDirection: Axis.horizontal,
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          hintText: 'Nhập tên sân...',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.lightGreen,
          ),
        ),
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
