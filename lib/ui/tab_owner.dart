import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                'https://i.imgur.com/tpOU8bp.jpg', 'Sân bóng ABC', 'Quận 9', 1),
            _buildListPitch(
                'https://i.imgur.com/tpOU8bp.jpg', 'Sân bóng ABC', 'Quận 9', 2),
            _buildListPitch(
                'https://i.imgur.com/tpOU8bp.jpg', 'Sân bóng ABC', 'Quận 9', 3),
            _buildListPitch(
                'https://i.imgur.com/tpOU8bp.jpg', 'Sân bóng ABC', 'Quận 9', 4),
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
        depth: 8,
        color: Colors.green[200],
        // lightSource: LightSource.topLeft,
      ),
      child: NeumorphicButton(
        style: NeumorphicStyle(color: Colors.green[200]),
        child: Text(
          'THÊM SÂN',
          style: TextStyle(fontSize: 20),
        ),
        // color: Colors.lightGreen,
        onPressed: () {
          setState(() {
            Fluttertoast.showToast(
                msg: "Thêm sân thành công",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
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
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 75,
                    // padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: Image.network(imgURL).image,
                      // fit: BoxFit.cover,
                    )),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " " + pitchName,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " " + address,
                        style: TextStyle(
                          fontSize: 13,
                        ),
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
