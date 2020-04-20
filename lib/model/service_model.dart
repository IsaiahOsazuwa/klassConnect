class Services {
  int id;
  String serviceRequested;
  int paymentStatus;
  String assignment;
  String timeRequested;
  int serviceId;

  Services(
      {this.id,
      this.serviceRequested,
      this.paymentStatus,
      this.assignment,
      this.timeRequested,
      this.serviceId});

  factory Services.fromJason(Map<String, dynamic> service) {
    return Services(
        id: service['id'],
        serviceRequested: service['service'],
        paymentStatus: service['payment_status'],
        assignment: service['is_assigned'],
        timeRequested: service['created_at'],
      serviceId: service['service_id']
    );
  }
}
