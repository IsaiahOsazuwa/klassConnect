import 'package:flutter/material.dart';
import 'package:klass_korporate/model/reservationdetail_model.dart';
import 'package:klass_korporate/services/networking.dart';

class NameReserveDetails extends StatefulWidget {
  final int id;
  final String preferredName;
  final String alternativeName;
  final String availabilityCode;
  final String orderTrackingNumber;
  final bool nameApproval;

  NameReserveDetails(
      {@required this.id,
      this.preferredName,
      this.alternativeName,
      this.availabilityCode,
      this.orderTrackingNumber,
      this.nameApproval});

  @override
  _NameReserveDetailsState createState() => _NameReserveDetailsState();
}

class _NameReserveDetailsState extends State<NameReserveDetails> {
  Networking networking = Networking();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    networking.getReservationDetails(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Preferred Name:'),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(widget.preferredName)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Alternative Name'),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(widget.alternativeName)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Availability Code:'),
                    SizedBox(
                      width: 5.0,
                    ),
                    widget.availabilityCode != null
                        ? Text(widget.availabilityCode)
                        : Text('')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Order Tracking Number:'),
                    SizedBox(
                      width: 5.0,
                    ),
                    widget.orderTrackingNumber != null
                        ? Text(widget.orderTrackingNumber)
                        : Text('')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Name Approval:'),
                    SizedBox(
                      width: 5.0,
                    ),
                    widget.nameApproval != null
                        ? Text(widget.nameApproval.toString())
                        : Text('Not yet approved')
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: networking.getReservationDetails(widget.id),
            builder: (BuildContext context, AsyncSnapshot snap){
              if(snap.hasData){
                ReservationDetails nameResData = snap.data;
                return Expanded(
                  child: Card(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text('Reservation Details',style: TextStyle(fontSize: 18,),),
                          ),
                          Row(
                            children: <Widget>[
                              Text('Order id:'),
                              SizedBox(width: 5.0,),
                              Text(nameResData.orderId.toString())
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('id:'),
                              SizedBox(width: 5.0,),
                              Text(nameResData.id.toString())
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Date:'),
                              SizedBox(width: 5.0,),
                              Text(nameResData.date.substring(0,10))
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Specific Type:'),
                              SizedBox(width: 5.0,),
                              Text(nameResData.specificType)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Reason for Search:'),
                              SizedBox(width: 5.0,),
                              Text(nameResData.reasonForSearch)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Remark:'),
                              SizedBox(width: 5.0,),
                              Text(nameResData.remark)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Company Name:'),
                              SizedBox(width: 5.0,),
                              nameResData.companyName !=null?Text(nameResData.companyName):Text('null')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Nature of Business:'),
                              SizedBox(width: 5.0,),
                              nameResData.natureOfBusiness!=null?Text(nameResData.natureOfBusiness):Text('null')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )

        ],
      ),
    );
  }
}

