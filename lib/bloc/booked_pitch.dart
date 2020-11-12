class PitchBooked {
  String namePitch, address;
  int timeFrom, timeTo, price, total, count, type;
  bool booked;

  PitchBooked({
    this.namePitch,
    this.timeFrom,
    this.timeTo,
    this.total,
    this.price,
    this.address,
    this.booked,
    this.count,
    this.type,
  });
}

List<PitchBooked> LIST_BOOKED = [
  PitchBooked(
    timeFrom: 0,
    timeTo: 0,
    count: 0,
    type: 5,
    price: 110000,
  ),
];
