class PitchInfor {
  String namePitch;
  String address;
  int price;
  double rate;
  double local;
  int promotion;
  String image;

  PitchInfor({
    this.namePitch,
    this.address,
    this.price,
    this.rate,
    this.local,
    this.promotion,
    this.image,
  });
}

List<PitchInfor> LIST_PITCH = [
  PitchInfor(
      namePitch: 'Sân bóng 5 người - Tiến Phát',
      address: 'Quận 9',
      local: 4.6,
      price: 100000,
      promotion: 0,
      rate: 3.5,
      image: "https://i.imgur.com/tpOU8bp.jpg"),
  PitchInfor(
      namePitch: 'Sân bóng 7 người - Tiến Phát',
      address: 'Quận 9',
      local: 4.6,
      price: 120000,
      promotion: 0,
      rate: 3.8,
      image: "https://i.imgur.com/tpOU8bp.jpg"),
  PitchInfor(
      namePitch: 'Sân bóng 11 người - Tiến Phát',
      address: 'Quận 9',
      local: 4.6,
      price: 100000,
      promotion: 0,
      rate: 3.5,
      image: "https://i.imgur.com/tpOU8bp.jpg"),
];
