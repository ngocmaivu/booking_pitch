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
      //   title: Text('Quản lí sân'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSearchTextField(),
              // CircleAvatar(
              //   backgroundImage:
              //       NetworkImage("https://i.imgur.com/zismATK.png"),
              //   backgroundColor: Colors.lightGreen,
              //   radius: 25,
              // ),
              _buildIcons(),
              BuildGroupTitle(
                title: 'Sân quanh đây',
                isShowAll: true,
              ),
              Container(
                height: 220,
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
              BuildGroupTitle(
                title: 'Đang khuyến mãi',
                isShowAll: true,
              ),
              Container(
                height: 240,
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
              BuildGroupTitle(
                title: 'Sân được đánh giá cao',
                isShowAll: true,
              ),
              Container(
                height: 220,
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
    );
  }

  Widget _buildSearchTextField() {
    return Neumorphic(
      margin: EdgeInsets.fromLTRB(5, 20, 5, 25),
      padding: EdgeInsets.only(
        left: 20,
      ),
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
        depth: 1,
        color: Colors.white,
        // lightSource: LightSource.topLeft,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Nhập tên sân...',
          suffixIcon: Icon(
            Icons.search_rounded,
            color: Colors.green,
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
              depth: 0,
              lightSource: LightSource.topLeft,
            ),
            child: CircleAvatar(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
              maxRadius: 25,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              depth: 0,
              lightSource: LightSource.topLeft,
            ),
            child: CircleAvatar(
              child: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
              maxRadius: 25,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              depth: 0,
              lightSource: LightSource.topLeft,
            ),
            child: CircleAvatar(
              child: Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              backgroundColor: Colors.green,
              maxRadius: 25,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              depth: 0,
              lightSource: LightSource.topLeft,
            ),
            child: CircleAvatar(
              child: Icon(
                Icons.more_time,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
              maxRadius: 25,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              depth: 0,
              lightSource: LightSource.topLeft,
            ),
            child: CircleAvatar(
              child: Icon(
                Icons.assistant_photo_rounded,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
              maxRadius: 25,
            ),
          ),
        ],
      ),
    );
  }
}
