class NameReservation {
  int id;
  int orderId;
  String name;
  String availabilityCode;
  String alternativeName;
  String dateRegistered;
  bool isApproved;
  List businessName;

  NameReservation(
      {this.id,
      this.orderId,
      this.name,
      this.availabilityCode,
      this.alternativeName,
      this.dateRegistered,
      this.isApproved,
      this.businessName});

  factory NameReservation.fromJason(Map<String, dynamic> nameRes) {
    return NameReservation(
      id: nameRes['id'],
      orderId: nameRes['order_id'],
      dateRegistered: nameRes['created_at'],
      businessName: nameRes['business-names'],
      availabilityCode: nameRes['business-names'][0]['availability_code'],
      isApproved: nameRes['business-names'][0]['is_approved'],
      name: nameRes['business-names'][0]['name'],
      alternativeName: nameRes['business-names'][1]['name'],
    );
  }
}
