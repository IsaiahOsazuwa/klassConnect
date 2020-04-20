import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klass_korporate/model/service_model.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyServiceOrderScreen extends StatelessWidget {
  static const String id = 'service_screen';
  Networking networking = Networking();

  final String title = 'My Resent Services Orders';
  final String subtitle1 = 'Request';
  final String subtitle2 = 'Payment Status';
  final String subtitle3 = 'Assignment Status';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Card(
          child: Container(
            margin: EdgeInsets.only(bottom: 4.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: networking.getServiceData(),
              builder: (BuildContext context, AsyncSnapshot snapService) {
                if (snapService.hasData) {
                  List<Services> serviceList = snapService.data;
                  print(serviceList);
                  return ListView.separated(
                    separatorBuilder: (_, __) =>
                        Divider(height: 1, color: Color(0xff173366)),
                    itemCount: serviceList.length,
                    itemBuilder: (_, index) {
                      final item = serviceList[index].id.toString();
                      return Slidable(
                        key: Key(item),
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'More',
                            color: Colors.black45,
                            icon: Icons.more_horiz,
                            // onTap: () => _showSnackBar('More'),
                          ),
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () async {
                              await networking
                                  .deleteService(serviceList[index].id);
                            },
                          ),
                        ],
                        child: Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 3.0),
                          child: Container(
                            padding: EdgeInsets.only(
                              bottom: 2.0,
                            ),
                            height: 100.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    height: double.infinity,
                                    child: Icon(
                                      Icons.settings_system_daydream,
                                      color: Colors.white,
                                      size: 70.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(right: 2.0),
                                        child: Text(
                                          serviceList[index].serviceRequested,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 17.0,
                                          ),
                                          Text(
                                            serviceList[index].assignment !=
                                                    null
                                                ? serviceList[index].assignment
                                                : 'Not assigned',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 12.0,
                                          ),
                                          Text(
                                            serviceList[index]
                                                .timeRequested
                                                .substring(0, 10),
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin:
                                                EdgeInsets.only(right: 16.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: serviceList[index]
                                                          .paymentStatus !=
                                                      null
                                                  ? Colors.green
                                                  : Colors.blueGrey,
                                            ),
                                            height: 30.0,
                                            width: 80.0,
                                            child: Center(
                                                child: Text(
                                              serviceList[index]
                                                          .paymentStatus !=
                                                      null
                                                  ? serviceList[index].paymentStatus.toString()
                                                  : 'Pending',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}

//Future<bool> ConfirmDimiss(){
//  bool action;
//  showDialog(
//    context: context,
//    barrierDismissible: true,
//    builder: (BuildContext context) {
//      return AlertDialog(
//        title: Text('Service Dismissal'),
//        content: Text('Do you want to delete this service?'),
//        actions: <Widget>[
//          FlatButton(
//            child: Text('No'),
//            onPressed: () {
//              action = false;
//            },
//          ),
//          FlatButton(
//            child: Text('Yes'),
//            onPressed: () {
//              action = true;
//            },
//          )
//        ],
//      );
//    },
//  );
//  return action;
//}
