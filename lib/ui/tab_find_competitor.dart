import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabFindCompetitor extends StatefulWidget {
  @override
  _TabFindCompetitor createState() => _TabFindCompetitor();
}

class _TabFindCompetitor extends State<TabFindCompetitor> {
  double get radius => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
             backgroundColor: Colors.lightGreen,
            title: Text('Trận đấu'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.search),
                  text: 'Tìm đối thủ',
                ),
                Tab(
                  icon: Icon(Icons.add_circle),
                  text: 'Tạo trận',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Column(
                  children: [
                    _buildSearchTextField(),
                    _buildCompertitor(),
                  ],
                ),
              ),
              Center(
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Tên trận',
                            ),
                          ),
                          flex: 4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Tên sân',
                            ),
                          ),
                          flex: 4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            'Thời gian',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              hintText: '',
                            ),
                          ),
                          flex: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Liên hệ',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              hintText: '',
                            ),
                          ),
                          flex: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Ghi chú',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              hintText: '',
                            ),
                          ),
                          flex: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
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
                            onPressed: () {},
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Padding _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          hintText: 'Nhập tên đội...',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.lightGreen,
          ),
        ),
      ),
    );
  }
}

Widget _buildCompertitor({
  bool showMore: true,
}) {
  return Container(
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
              child: Text("FPT"),
              backgroundColor: Colors.orange,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Giao hữu tại quận 9',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.gps_fixed, color: Colors.lightGreen,),
                  Text('Sân bóng đá mini quận 9'),
                ],
              ),

              Text(
                'Thứ Tư, 14:45 - 12/11/2020',
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
