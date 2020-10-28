import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporttt/utils/date_time_picker.dart';

class PitchDetail extends StatefulWidget {
  @override
  _PitchDetail createState() => _PitchDetail();
}

class _PitchDetail extends State<PitchDetail> {
  List<bool> press = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> booked = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List _listPrice = ['100 000 VND/h', '120 000 VND/h', '150 000 VND/h'];
  String value;

  // List pressed = new JsArray();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Đặt sân'),
      ),
      body: ListView(padding: const EdgeInsets.fromLTRB(5, 0, 5, 0), children: [
        GestureDetector(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 11,
                ),
                Container(
                  height: 150,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image:
                        Image.network("https://i.imgur.com/tpOU8bp.jpg").image,
                    fit: BoxFit.cover,
                  )),
                ),
                SizedBox(
                  height: 11,
                ),
                Text('Sân bóng Tiến Phát',
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
                SizedBox(
                  height: 11,
                ),
                Row(children: [
                  Expanded(
                    child: Text('Địa chỉ: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19)),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text('  112/3 Lê Văn Việt, Q9',
                        style: TextStyle(color: Colors.black, fontSize: 19)),
                    flex: 4,
                  ),
                ]),
                Row(children: [
                  Text('Đánh giá: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19)),
                  Text(
                    ' 4.1',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text('  SĐT: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19)),
                  Text(
                    '0332756462',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  Icon(
                    Icons.phone_enabled,
                    color: Colors.grey,
                  )
                ]),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text('Giá: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19)),
                    SizedBox(
                      width: 30,
                    ),
                    _buildDropdown(),
                  ],
                ),
                Row(
                  children: [
                    Text('Chọn ngày    ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19)),
                    DatePickerDemo(),
                  ],
                ),
                Text('    Chọn giờ:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(
                  height: 11,
                ),
                Table(
                  border: TableBorder.all(width: 0),
                  children: [
                    TableRow(children: <Widget>[
                      RaisedButton(
                        color: press[0] ? Colors.grey : Colors.white,
                        onPressed: () {
                          if (booked[0] == false)
                            setState(() {
                              press[0] = !press[0];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('8:00 - 9:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      RaisedButton(
                        color: press[1] ? Colors.grey : Colors.white,
                        onPressed: () {
                          if (booked[1] == false)
                            setState(() {
                              press[1] = !press[1];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('9:00 - 10:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      RaisedButton(
                        color: press[2] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[2] == false)
                            setState(() {
                              press[2] = !press[2];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('10:00-11:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      RaisedButton(
                        color: press[3] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[3] == false)
                            setState(() {
                              press[3] = !press[3];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('11:00-12:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      RaisedButton(
                        color: press[4] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[4] == false)
                            setState(() {
                              press[4] = !press[4];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('12:00-13:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      RaisedButton(
                        color: press[5] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[5] == false)
                            setState(() {
                              press[5] = !press[5];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('13:00-14:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      RaisedButton(
                        color: press[6] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[6] == false)
                            setState(() {
                              press[6] = !press[6];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('14:00-15:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      RaisedButton(
                        color: press[7] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[7] == false)
                            setState(() {
                              press[7] = !press[7];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('15:00-16:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      RaisedButton(
                        color: press[8] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[8] == false)
                            setState(() {
                              press[8] = !press[8];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('16:00-17:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      RaisedButton(
                        color: press[9] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[9] == false)
                            setState(() {
                              press[9] = !press[9];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('17:00-18:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      RaisedButton(
                        color: press[10] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[10] == false)
                            setState(() {
                              press[10] = !press[10];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('18:00-19:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      RaisedButton(
                        color: press[11] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[11] == false)
                            setState(() {
                              press[11] = !press[11];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('19:00-20:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      RaisedButton(
                        color: press[12] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[12] == false)
                            setState(() {
                              press[12] = !press[12];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('20:00-21:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      RaisedButton(
                        color: press[13] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[13] == false)
                            setState(() {
                              press[13] = !press[13];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('21:00-22:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      RaisedButton(
                        color: press[14] ? Colors.lightGreen : Colors.white,
                        onPressed: () {
                          if (booked[14] == false)
                            setState(() {
                              press[14] = !press[14];
                            });
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('22:00-23:00',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ])
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 180,
                    ),
                    Text('* Khung giờ đã được đặt - chọn '),
                    Icon(
                      Icons.web_asset,
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Ghi chú',
                        style: TextStyle(
                          fontSize: 19,
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
                        child: Text(
                          'ĐẶT SÂN',
                          style: TextStyle(fontSize: 20),
                        ),
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
              ]),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildDropdown() {
    return Container(
      child: DropdownButton(
        hint: Text("Chọn giá."),
        elevation: 9,
        value: value,
        dropdownColor: Colors.lightGreen,
        onChanged: (newValue) {
          setState(() {
            value = newValue;
          });
        },
        items: _listPrice.map((newValue) {
          return DropdownMenuItem(
            value: newValue,
            child: Text(newValue),
          );
        }).toList(),
      ),
    );
  }
}
