class PitchModel {
  String name;
  int price;
  String area;
  int amount;
  double star;
  int timeOpen;
  int timeClose;

  PitchModel(
      {this.name,
      this.price,
      this.area,
      this.amount,
      this.star,
      this.timeOpen,
      this.timeClose});
}

List<PitchModel> LIST_PITCH = [
  PitchModel(
      amount: 2,
      area: "Quan 9 ~ 4.5km",
      name: "Sân bóng 5 người Hải Âu",
      price: 50000,
      star: 4.1,
      timeClose: 22,
      timeOpen: 9),
  PitchModel(
      amount: 2,
      area: "Quan 9",
      name: "Sân bóng 7 người Hải Âu",
      price: 50000,
      star: 5,
      timeClose: 22,
      timeOpen: 9),
  PitchModel(
      amount: 2,
      area: "Quan 9",
      name: "Sân bóng 11 người Hải Âu",
      price: 50000,
      star: 5,
      timeClose: 22,
      timeOpen: 9)
];
