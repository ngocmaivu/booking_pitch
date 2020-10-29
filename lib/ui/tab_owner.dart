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
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Quản lí sân'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(''),
            _buildListPitch(
                'https://i.imgur.com/tpOU8bp.jpg', 'Sân bóng ABC', 'Quận 9', 1),
            _buildListPitch(
                'https://i.imgur.com/tpOU8bp.jpg', 'Sân bóng ABC', 'Quận 9', 2),
            _buildListPitch(
                'https://i.imgur.com/tpOU8bp.jpg', 'Sân bóng ABC', 'Quận 9', 3),
            _buildListPitch(
                'https://i.imgur.com/tpOU8bp.jpg', 'Sân bóng ABC', 'Quận 9', 4),
            addPitch(),
          ],
        ),
      ),
    );
  }

  Widget addPitch() {
    return Row(
      children: [
        Expanded(
          child: FlatButton(
            child: Text(''),
            color: Colors.white,
            onPressed: () {},
          ),
          flex: 1,
        ),
        Expanded(
          child: FlatButton(
            child: Text('THÊM MỚI'),
            color: Colors.lightGreen,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TabPitch(),
              ));
            },
          ),
          flex: 3,
        ),
        Expanded(
          child: FlatButton(
            child: Text(''),
            color: Colors.white,
            onPressed: () {},
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget _buildListPitch(
      String imgURL, String pitchName, String address, int id) {
    return GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookingPitchManagement(),
            )),
        child: Neumorphic(
            style: NeumorphicStyle(
                // color: Colors.grey[200],
                color: Colors.white,
                border: NeumorphicBorder(color: Colors.black)),
            padding: EdgeInsets.all(8),
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
