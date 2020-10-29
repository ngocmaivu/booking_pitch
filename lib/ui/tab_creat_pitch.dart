import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabPitch extends StatefulWidget {
  @override
  _TabPitch createState() => _TabPitch();
}

class _TabPitch extends State<TabPitch> {
  double get radius => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Thêm sân mới'),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Tên',
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
                    'Địa chỉ',
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
                    'Giá',
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
        ));
  }
}
