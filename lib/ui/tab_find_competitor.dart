import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabFindCompetitor extends StatefulWidget {
  @override
  _TabFindCompetitor createState() => _TabFindCompetitor();
}

String changedText = 'Tham gia';
String changedText1 = 'Tham gia';

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
              ListView(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  children: [
                    GestureDetector(
                        child: SafeArea(
                            child: SingleChildScrollView(
                                child: Column(children: [
                      _buildSearchTextField(),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                // padding: EdgeInsets.all(8),
                                child: CircleAvatar(
                                  child: Text("FPT"),
                                  backgroundColor: Colors.orange,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Giao hữu tại quận 9',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.gps_fixed,
                                        color: Colors.lightGreen,
                                      ),
                                      Text('Sân bóng đá mini quận 9'),
                                    ],
                                  ),
                                  Text(
                                    'Thứ Tư, 14:45 - 12/11/2020',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              flex: 4,
                            ),
                            Expanded(
                                child: RaisedButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      changedText = 'Chờ chấp thuận';
                                    });
                                  },
                                  child: Container(
                                    child: Text('${changedText}',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black)),
                                  ),
                                ),
                                flex: 3)
                          ],
                        ),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                            left: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                            right: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                            top: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                // padding: EdgeInsets.all(8),
                                child: CircleAvatar(
                                  child: Text("SPKT"),
                                  backgroundColor: Colors.yellow,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Giao hữu cùng SPKT',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.gps_fixed,
                                        color: Colors.lightGreen,
                                      ),
                                      Text('Sân bóng đá Hiệp Phú'),
                                    ],
                                  ),
                                  Text(
                                    'Thứ Sáu, 17:00 - 30/10/2020',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              flex: 4,
                            ),
                            Expanded(
                                child: RaisedButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      changedText1 = 'Chờ chấp thuận';
                                    });
                                  },
                                  child: Container(
                                    child: Text('${changedText1}',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black)),
                                  ),
                                ),
                                flex: 3)
                          ],
                        ),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                            left: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                            right: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ]))))
                  ]),
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
      padding: const EdgeInsets.fromLTRB(14, 5, 14, 15),
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
