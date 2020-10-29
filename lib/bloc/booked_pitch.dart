class PitchBooked {
  String namePitch;
  int timeTo;
  int timeFrom;
  bool booked;

  PitchBooked({this.namePitch, this.timeTo, this.timeFrom, this.booked});
}

List<PitchBooked> LIST_BOOKED = [
  PitchBooked(
      namePitch: 'Sân bóng 5 người Tiến Phát',
      timeFrom: 8,
      timeTo: 10,
      booked: true)
];
