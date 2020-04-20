import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klass_korporate/screens/business_name_form.dart';
import 'package:klass_korporate/model/businessname_model.dart';
import 'package:klass_korporate/services/networking.dart';

class BusinessNameScreen extends StatelessWidget {
  static const String id = 'business_name';
  Networking networking = Networking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173366),
        title: Text('Business Name'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          Navigator.pushNamed(context, BusinessNameForm.id);
        },
        backgroundColor: Color(0xff173366),
      ),
      body: Container(
        child: FutureBuilder(
          future: networking.getBusinessNameData(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List<BusinessName> businessNameList = snap.data;
              return ListView.separated(
                separatorBuilder: (_, __) =>
                    Divider(height: 1, color: Color(0xff173366)),
                itemCount: businessNameList.length,
                itemBuilder: (_, index) {
                  return Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
                    child: Container(
                      height: 100.0,
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              child:
                                  Text(businessNameList[index].id.toString()),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  businessNameList[index].name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text('Tracking Number:'),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Container(
                                      child: Text(
                                        businessNameList[index].trackingNumber,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                businessNameList[index].payment != null
                                    ? Text(businessNameList[index].payment)
                                    : Row(
                                        children: <Widget>[
                                          Text('Payment Status:'),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(6.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: businessNameList[index]
                                                          .payment !=
                                                      null
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                            child: Text(
                                              businessNameList[index].payment !=
                                                      null
                                                  ? businessNameList[index]
                                                      .payment
                                                  : 'Not Paid',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
