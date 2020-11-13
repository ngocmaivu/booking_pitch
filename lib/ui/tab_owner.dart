import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sporttt/ui/tab_creat_pitch.dart';
import 'package:sporttt/ui/tab_mana_booked_pitch_admin.dart';

class PitchManagement extends StatefulWidget {
  @override
  _PitchManagement createState() => _PitchManagement();
}

class _PitchManagement extends State<PitchManagement> {
  String value;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Quản lí sân'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // Text(''),
            _buildListPitch(
                'https://www.sporta.vn/bai-viet/wp-content/uploads/2018/04/IMG_0830-1024x768.jpg',
                'Sân bóng Hải Âu',
                '23/4 Lã Xuân Oai - LT - Quận 9',
                1),
            _buildListPitch(
                'https://images.foody.vn/res/g23/221306/prof/s576x330/foody-mobile-10665737_54096537604-214-635944317843677527.jpg',
                'Sân bóng Văn Linh',
                '123 Lê Văn Việt - LT - Quận 9',
                2),
            _buildListPitch(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSp87QSHXl6JIkQ0XifT9Q9gGae0-tCol7u9A&usqp=CAU',
                'Sân bóng Phát Đạt',
                '67/4 Đường số 2 - Quận 9',
                3),
            // _buildListPitch(
            //     'https://theparanormalanalyst.com/wp-content/uploads/2019/10/kich-thuoc-san-bong-da-5-nguoi-1024x543.png',
            //     'Sân bóng Thành Công',
            //     'Quận 9',
            //     4),
            SizedBox(
              height: 15,
            ),
            addPitch(),
          ],
        ),
      ),
    );
  }

  Widget addPitch() {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
        depth: 1,
        color: Colors.green,
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
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => TabAddPitch(),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildListPitch(
      String imgURL, String pitchName, String address, int id) {
    return GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookingPitchManagement(),
            )),
        child: Neumorphic(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            style: NeumorphicStyle(
                depth: 0,
                border: NeumorphicBorder(width: 1),
                color: Colors.white),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 75,
                    // padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: Image.network(imgURL).image,
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "  " + pitchName,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Colors.red,
                          ),
                          Text(
                            "" + address,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  flex: 7,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Icon(Icons.expand_more),
                  ),
                ),
              ],
            )));
  }
}
