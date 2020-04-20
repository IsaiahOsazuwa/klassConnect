class DashBoardStats {
  int nameReservation;
  int companyRegistration;
  int businessNameRegistration;

  DashBoardStats(
      {this.nameReservation,
      this.companyRegistration,
      this.businessNameRegistration});

  factory DashBoardStats.fromJson(Map<String, dynamic> dash) {
    return DashBoardStats(
        nameReservation: dash['data'][0]['name_reservation'],
        companyRegistration: dash['data'][1]['company_registration'],
        businessNameRegistration: dash['data'][2]
            ['business_name_registration']);
  }
}
