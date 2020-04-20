class ServiceDetails {
  int id;
  String trackingNumber;
  String dateCreated;
  String paymentStatus;
  String service;
  String assignmentStatus;
  int dispatchedNotice;

  ServiceDetails(
      {this.id,
      this.trackingNumber,
      this.dateCreated,
      this.paymentStatus,
      this.service,
      this.assignmentStatus,
      this.dispatchedNotice});

  factory ServiceDetails.fromJason(Map<String, dynamic> serviceData) {
    return ServiceDetails(
      id: serviceData['id'],
      dateCreated: serviceData['created_at'],
      assignmentStatus: serviceData['is_assigned'],
      service: serviceData['service'],
      paymentStatus: serviceData["payment_status"],
      trackingNumber: serviceData["tracking_number"],
      dispatchedNotice: serviceData["is_dispatched"],
    );
  }
}
