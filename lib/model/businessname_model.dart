class BusinessName {
  int id;
  String name;
  String trackingNumber;
  String payment;
  String availabilityCode;
  String dateRegistered;

  BusinessName(
      {this.id,
      this.name,
      this.trackingNumber,
      this.payment,
      this.availabilityCode,
      this.dateRegistered});

  factory BusinessName.fromJason(Map<String, dynamic> bussName) {
    return BusinessName(
        dateRegistered: bussName['created_at'],
        id: bussName['id'],
        name: bussName['name'],
        payment: bussName['payment_status'],
        availabilityCode: bussName['availability_code'],
        trackingNumber: bussName['tracking_number']);
  }
}
