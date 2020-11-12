class PitchModel {
  String name;
  int price;
  String address;
  String type;
  double rate;
  double local;
  int promotion;
  String image;

  PitchModel({
    this.name,
    this.price,
    this.address,
    this.promotion,
    this.rate,
    this.local,
    this.image,
    this.type,
  });
}

List<PitchModel> LIST_PITCH_LOCAL = [
  PitchModel(
    local: 2.2,
    name: "Sân bóng 5 người Hải Âu",
    price: 110000,
    rate: 3.1,
    image: "https://i.imgur.com/wAvKH6M.jpg",
    promotion: 0,
    address: "Quận 9",
  ),
  PitchModel(
    local: 3.5,
    name: "Sân bóng 5 người Liên Hợp",
    price: 100000,
    rate: 2.4,
    image:
        "https://www.sporta.vn/bai-viet/wp-content/uploads/2018/04/IMG_0830-1024x768.jpg",
    promotion: 0,
    address: "Quận 9",
  ),
  PitchModel(
    local: 3.5,
    name: "Sân bóng 7 người Hải Nam",
    price: 130000,
    rate: 4.1,
    image:
        "https://www.sporta.vn/bai-viet/wp-content/uploads/2017/10/hiuhoanglong2-225x300.jpg",
    promotion: 0,
    address: "Quận 9",
  ),
  PitchModel(
    local: 4.1,
    name: "Sân bóng 11 người Trung",
    price: 150000,
    rate: 4.3,
    image: "https://i.imgur.com/i10lB5U.jpg",
    promotion: 0,
    address: "Quận 9",
  ),
  PitchModel(
    local: 4.4,
    name: "Sân bóng 7 người Trung Âu",
    price: 170000,
    rate: 3.4,
    image:
        "https://placevietnam.com/img/full/gallery/1/khong-gian-san-bong-da-hieu-hoang-long-1-1533005933.jpg",
    promotion: 0,
    address: "Quận 9",
  ),
  PitchModel(
    local: 5,
    name: "Sân bóng 7 người 177",
    price: 130000,
    rate: 3.7,
    image: "https://i.imgur.com/vjtCDBQ.jpg",
    promotion: 0,
    address: "Quận 9",
  )
];

List<PitchModel> LIST_PITCH_RATE = [
  PitchModel(
    local: 3.5,
    name: "Sân bóng 5 người Vương",
    price: 125000,
    rate: 4.1,
    image:
        "https://conhantaovandat.net/wp-content/uploads/2019/10/can-chu-y-den-kich-thuoc-san-bong.jpg",
    promotion: 0,
    address: "Quận Thủ Đức",
  ),
  PitchModel(
    local: 3.5,
    name: "Sân bóng 7 người Hải Nam",
    price: 130000,
    rate: 4.3,
    image:
        "https://images.foody.vn/res/g17/167794/prof/s576x330/foody-mobile-san-bong-jpg-411-635811265376963717.jpg",
    promotion: 0,
    address: "Quận Thủ Đức",
  ),
  PitchModel(
    local: 3.5,
    name: "Sân bóng 11 người Liên",
    price: 170000,
    rate: 4.5,
    image:
        "https://santhethao.com.vn/uploads/images/tin-tuc/co-nhan-tao-san-bong-1.jpg",
    promotion: 0,
    address: "Quận 9",
  ),
  PitchModel(
    local: 4.5,
    name: "Sân bóng 5 người Long Châu",
    price: 130000,
    rate: 4.1,
    image:
        "https://htsport.vn/wp-content/uploads/2020/06/danh-sach-san-bong-o-di-an-binh-duong.png",
    promotion: 0,
    address: "Quận 9",
  ),
  PitchModel(
    local: 3.5,
    name: "Sân bóng 7 người Vương Thành",
    price: 140000,
    rate: 4.6,
    image:
        "https://file.hstatic.net/1000261193/article/collage31_d0cbe61ebf584eeabe54c52777e2b68f_d07fabe230494958b266571b7fba51f2_1024x1024.jpg",
    promotion: 0,
    address: "Quận Thủ Đức",
  ),
];

List<PitchModel> LIST_PITCH_PROMOTION = [
  PitchModel(
    local: 11.5,
    name: "Sân bóng 11 người Phát",
    price: 165000,
    rate: 4.1,
    image:
        "https://images.foody.vn/res/g23/221306/prof/s576x330/foody-mobile-10665737_54096537604-214-635944317843677527.jpg",
    promotion: 150000,
    address: "Quận Gò Vấp",
  ),
  PitchModel(
    local: 7.5,
    name: "Sân bóng 7 người Nam Trung",
    price: 150000,
    rate: 4.3,
    image:
        "https://file.hstatic.net/1000261193/article/collage31_d0cbe61ebf584eeabe54c52777e2b68f_d07fabe230494958b266571b7fba51f2_1024x1024.jpg",
    promotion: 140000,
    address: "Quận Thủ Đức",
  ),
  PitchModel(
    local: 3.5,
    name: "Sân bóng 11 người Liên Hoa",
    price: 170000,
    rate: 4.5,
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSp87QSHXl6JIkQ0XifT9Q9gGae0-tCol7u9A&usqp=CAU",
    promotion: 155000,
    address: "Quận 9",
  ),
  PitchModel(
    local: 4.5,
    name: "Sân bóng 5 người Long",
    price: 130000,
    rate: 4.1,
    image:
        "https://dabong.online/wp-content/uploads/2020/01/S%C3%A2n-b%C3%B3ng-%C4%91%C3%A1-Thanh-T%C3%B9ng-%E2%80%93-Qu%E1%BA%ADn-2-%E2%80%93-Tp-HCM.jpg",
    promotion: 115000,
    address: "Quận 9",
  ),
  PitchModel(
    local: 3.5,
    name: "Sân bóng 7 người Thành Phú",
    price: 140000,
    rate: 4.6,
    image:
        "https://theparanormalanalyst.com/wp-content/uploads/2019/10/kich-thuoc-san-bong-da-5-nguoi-1024x543.png",
    promotion: 130000,
    address: "Quận 9",
  ),
];
