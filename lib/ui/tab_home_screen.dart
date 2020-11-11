import 'package:flutter/material.dart';
import 'package:sporttt/bloc/pitch.dart';
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
      // appBar: NeumorphicAppBar(
      //   title: Text('Trang chủ'),
      // ),
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
                        height: 25,
                      ),
                      _buildIcons(),
                      SizedBox(
                        height: 15,
                      ),
                      BuildGroupTitle(
                        title: 'Sân quanh đây',
                        isShowAll: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 250,
                        child: ListView.builder(
                          itemBuilder: (context, index) => Pitch(
                            namePitch: LIST_PITCH_LOCAL[index].name,
                            address: LIST_PITCH_LOCAL[index].address,
                            price: LIST_PITCH_LOCAL[index].price,
                            promotion: LIST_PITCH_LOCAL[index].promotion,
                            rate: LIST_PITCH_LOCAL[index].rate,
                            local: LIST_PITCH_LOCAL[index].local,
                            image: LIST_PITCH_LOCAL[index].image,
                          ),
                          itemCount: LIST_PITCH_LOCAL.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BuildGroupTitle(
                        title: 'Đang khuyến mãi',
                        isShowAll: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 250,
                        child: ListView.builder(
                          itemBuilder: (context, index) => Pitch(
                            namePitch: LIST_PITCH_PROMOTION[index].name,
                            address: LIST_PITCH_PROMOTION[index].address,
                            price: LIST_PITCH_PROMOTION[index].price,
                            promotion: LIST_PITCH_PROMOTION[index].promotion,
                            rate: LIST_PITCH_PROMOTION[index].rate,
                            local: LIST_PITCH_PROMOTION[index].local,
                            image: LIST_PITCH_PROMOTION[index].image,
                          ),
                          itemCount: LIST_PITCH_PROMOTION.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BuildGroupTitle(
                        title: 'Sân được đánh giá cao',
                        isShowAll: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 250,
                        child: ListView.builder(
                          itemBuilder: (context, index) => Pitch(
                            namePitch: LIST_PITCH_RATE[index].name,
                            address: LIST_PITCH_RATE[index].address,
                            price: LIST_PITCH_RATE[index].price,
                            promotion: LIST_PITCH_RATE[index].promotion,
                            rate: LIST_PITCH_RATE[index].rate,
                            local: LIST_PITCH_RATE[index].local,
                            image: LIST_PITCH_RATE[index].image,
                          ),
                          itemCount: LIST_PITCH_RATE.length,
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
    return Neumorphic(
      margin: EdgeInsets.all(11),
      padding: EdgeInsets.only(left: 30, top: 5, bottom: 5),
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
        depth: 5,
        color: Colors.white,
        // lightSource: LightSource.topLeft,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Nhập tên sân...',
          suffixIcon: Icon(
            Icons.search_rounded,
            color: Colors.green[200],
            size: 30,
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
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              depth: 5,
              lightSource: LightSource.topLeft,
            ),
            child: CircleAvatar(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.green[200],
              maxRadius: 30,
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              depth: 5,
              lightSource: LightSource.topLeft,
            ),
            child: CircleAvatar(
              child: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              backgroundColor: Colors.green[200],
              maxRadius: 30,
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              depth: 5,
              lightSource: LightSource.topLeft,
            ),
            child: CircleAvatar(
              child: Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              backgroundColor: Colors.green[200],
              maxRadius: 30,
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              depth: 8,
              lightSource: LightSource.topLeft,
            ),
            child: CircleAvatar(
              child: Icon(
                Icons.more_time,
                color: Colors.white,
              ),
              backgroundColor: Colors.green[200],
              maxRadius: 30,
            ),
          ),
        ],
      ),
    );
  }
}
