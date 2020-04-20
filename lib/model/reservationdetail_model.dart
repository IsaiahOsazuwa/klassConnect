class ReservationDetails{
  int id;
  int orderId;
  String date;
  String specificType;
  String reasonForSearch;
  String remark;
  String companyName;
  String natureOfBusiness;

  ReservationDetails({this.id, this.orderId, this.date, this.specificType,
      this.reasonForSearch, this.remark, this.companyName,
      this.natureOfBusiness});

  factory ReservationDetails.fromJason(Map<String, dynamic> resDetail){
    return ReservationDetails(
      id: resDetail['id'],
      orderId: resDetail['order_id'],
      date: resDetail['created_at'],
      specificType: resDetail['specific_type']['name'],
      reasonForSearch: resDetail['reason_for_search']['name'],
      remark: resDetail['remark'],
      companyName: resDetail['company_name'],
      natureOfBusiness: resDetail['nature_of_business']['name'],

    );
  }

}