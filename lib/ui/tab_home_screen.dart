import 'package:flutter/material.dart';
import 'package:sporttt/utils/build_group_title.dart';
import 'package:sporttt/utils/build_infor_pitch.dart';

class TabHomeScreen extends StatefulWidget {
  @override
  _TabHomeScreenState createState() => _TabHomeScreenState();
}

class _TabHomeScreenState extends State<TabHomeScreen> {
  double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSearchTextField(),
                    BuildGroupTitle(
                      title: 'Sân quanh đây',
                      isShowAll: true,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Pitch(
                            namePitch: 'Sân bóng Tiến Phát',
                            address: 'Quận 9',
                            price: 100000,
                            promotion: 0,
                            rate: 4.1,
                            local: 4.5,
                          ),
                          Pitch(
                            namePitch: 'Sân bóng đá mini',
                            address: 'Quận 9',
                            price: 100000,
                            promotion: 0,
                            rate: 3.7,
                            local: 7.2,
                          ),
                          Pitch(
                              namePitch: 'Sân bóng Trương Văn Thành',
                              address: 'Quận 9',
                              price: 100000,
                              promotion: 0,
                              rate: 3.8,
                              local: 3.1
                          ),
                          Pitch(
                            namePitch: 'Sân Cỏ Hiệp Phú',
                            address: 'Quận 9',
                            price: 100000,
                            promotion: 0,
                            rate: 3.8,
                            local: 2.4,
                          ),
                        ],
                      ),
                    ),
                    BuildGroupTitle(
                      title: 'Đang khuyến mãi',
                      isShowAll: true,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Pitch(
                            namePitch: 'Sân bóng Tiến Phát',
                            address: 'Quận 9',
                            price: 100000,
                            promotion: 90000,
                            rate: 4.1,
                            local: 4.5,
                          ),
                          Pitch(
                            namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                            address: 'Phú Nhuận',
                            price: 100000,
                            promotion: 90000,
                            rate: 4.5,
                            local: 10.2,
                          ),
                          Pitch(
                            namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                            address: 'Phú Nhuận',
                            price: 100000,
                            promotion: 90000,
                            rate: 4.5,
                            local: 10.2,
                          ),
                          Pitch(
                            namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                            address: 'Phú Nhuận',
                            price: 100000,
                            promotion: 90000,
                            rate: 4.5,
                            local: 10.2,
                          ),
                        ],
                      ),
                    ),
                    BuildGroupTitle(
                      title: 'Sân được đánh giá cao',
                      isShowAll: true,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Pitch(
                            namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                            address: 'Phú Nhuận',
                            price: 100000,
                            promotion: 0,
                            rate: 4.5,
                            local: 10.2,
                          ),
                          Pitch(
                            namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                            address: 'Phú Nhuận',
                            price: 100000,
                            promotion: 0,
                            rate: 4.5,
                            local: 10.2,
                          ),
                          Pitch(
                            namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                            address: 'Phú Nhuận',
                            price: 100000,
                            promotion: 0,
                            rate: 4.5,
                            local: 10.2,
                          ),
                          Pitch(
                            namePitch: 'Sân Bóng trường THPT Phú Nhuận',
                            address: 'Phú Nhuận',
                            price: 100000,
                            promotion: 0,
                            rate: 4.5,
                            local: 10.2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 5, 14, 30),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          hintText: 'Tìm tên sân...',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.lightGreen,
          ),
        ),
      ),
    );
  }
}
