class PitchBooked {
  String namePitch;
  int time;
  bool booked;

  PitchBooked({this.namePitch, this.time, this.booked});
}

List<PitchBooked> LIST_BOOKED = [
  PitchBooked(
    namePitch: 'Sân bóng 5 người Hải Âu',
    time: 7,
    booked: true,
  ),
  PitchBooked(
    namePitch: 'Sân bóng 5 người Hải Âu',
    time: 12,
    booked: true,
  ),
];
