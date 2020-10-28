import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sporttt/ui/tab_home_screen.dart';
import 'package:sporttt/utils/date_time_picker.dart';

class BookingPitch extends StatefulWidget {
  @override
  _BookingPitch createState() => _BookingPitch();
}

class _BookingPitch extends State<BookingPitch> {
  List listPitchAvailable = [
    'Sân cỏ 5 - No1',
    'Sân cỏ 5 - No2',
    'Sân cỏ 7 - No1',
    'Sân cỏ 11 - No1'
  ];
  List _listPrice = [
    '100 000 VND/h',
    '100 000 VND/h',
    '120 000 VND/h',
    '150 000 VND/h'
  ];
  List _booking = [];
  List booked = [
    {8, 10},
    {14, 16}
  ];
  String value, price = '100 000 VND/h';
  int _selectedIndex;

  int index = 0;
  // @override
  // void initState() {
  //   _selectedIndex = 0;
  //   value = listPitchAvailable[0];
  //   // TODO: implement initState
  //   super.initState();
  // }

  // List pressed = new JsArray();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Đặt sân'),
        ),
        body:
            ListView(padding: const EdgeInsets.fromLTRB(5, 0, 5, 0), children: [
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
                image: Image.network("https://i.imgur.com/tpOU8bp.jpg").image,
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
              // listPitchAvailable
              children: [
                Text('Sân hiện có: ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19)),
                SizedBox(
                  width: 60,
                ),
                Text('Giá: ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19)),
              ],
            ),
            _buildDropdown(),
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
            Text('Chọn giờ:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(
              height: 11,
            ),
            Row(
              children: [
                Text('Từ  ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(
                  width: 30,
                ),
                _buildDropdownChooseTimeFrom(),
                SizedBox(
                  width: 30,
                ),
                Text('Tới  ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(
                  width: 30,
                ),
                _buildDropdownChooseTimeTo(),
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
              height: 15,
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
                    onPressed: () {
                      setState(() {
                        if (value == null) {
                          Fluttertoast.showToast(
                              msg: "Vui lòng chọn sân!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (valueTimeTo == null ||
                            valueTimeFrom == null) {
                          Fluttertoast.showToast(
                              msg: "Giờ không hợp lệ!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (valueTimeTo <= valueTimeFrom)
                          Fluttertoast.showToast(
                              msg: "Giờ không hợp lệ!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        else {
                          _booking.add(value);
                          _booking.add(_listPrice[index] *
                              (valueTimeTo - valueTimeFrom));
                          _booking.add(value);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => TabHomeScreen(),
                          // ));
                          Fluttertoast.showToast(
                              msg: "Đặt sân thành công",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.pop(context);
                        }
                      });
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
            ),
          ]))))
        ]));
  }

  Widget _buildDropdown() {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            DropdownButton(
              hint: Text("Chọn sân"),
              elevation: 9,
              value: value,
              dropdownColor: Colors.lightGreen,
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                  for (int i = 0; i < listPitchAvailable.length; i++)
                    if (listPitchAvailable[i].toString() == (value)) index = i;
                });
              },
              items: listPitchAvailable.map((newValue) {
                return DropdownMenuItem(
                  value: newValue,
                  child: Text(newValue),
                );
              }).toList(),
            ),
            SizedBox(
              width: 30,
            ),
            Text(_listPrice[index],
                style: TextStyle(color: Colors.black, fontSize: 19)),
          ],
        ),
      ],
    ));
  }

  List listTime = [8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
  int valueTimeFrom, valueTimeTo;
  Widget _buildDropdownChooseTimeFrom() {
    return Container(
      child: DropdownButton(
        hint: Text("Chọn giờ"),
        elevation: 5,
        value: valueTimeFrom,
        dropdownColor: Colors.lightGreen,
        onChanged: (newValue) {
          setState(() {
            valueTimeFrom = newValue;
          });
        },
        items: listTime.map((newValue) {
          return DropdownMenuItem(
            value: newValue,
            child: Text(newValue.toString()),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDropdownChooseTimeTo() {
    return Container(
      child: DropdownButton(
        hint: Text("Chọn giờ"),
        elevation: 5,
        value: valueTimeTo,
        dropdownColor: Colors.lightGreen,
        onChanged: (newValue) {
          setState(() {
            // if (valueTimeFrom >= newValue)
            //   valueTimeTo = newValue;
            // else
            valueTimeTo = newValue;
          });
        },
        items: listTime.map((newValue) {
          return DropdownMenuItem(
            value: newValue,
            child: Text(newValue.toString()),
          );
        }).toList(),
      ),
    );
  }
}
