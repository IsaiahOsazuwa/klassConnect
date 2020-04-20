import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:klass_korporate/screens/name_reserve_form.dart';
import 'package:klass_korporate/screens/namereservedetails_screen.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:klass_korporate/model/name_resev_model.dart';

class NameReservationScreen extends StatefulWidget {
  static const String id = 'name_reserve';

  @override
  _NameReservationScreenState createState() => _NameReservationScreenState();
}

class _NameReservationScreenState extends State<NameReservationScreen> {
  Networking networking = Networking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173366),
        title: Text('Name Reservation'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NameReserveForm.id);
        },
        backgroundColor: Color(0xff173366),
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: networking.getNameResData(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List<NameReservation> nameResList = snap.data;
              return ListView.separated(
                separatorBuilder: (_, __) =>
                    Divider(height: 1, color: Color(0xff173366)),
                itemCount: nameResList.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return NameReserveDetails(
                            id: nameResList[index].id,
                            preferredName: nameResList[index].name,
                            alternativeName: nameResList[index].alternativeName,
                            availabilityCode: nameResList[index].availabilityCode,
                            nameApproval: nameResList[index].isApproved,
                          );
                        }),
                      );
                    },
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
                      child: Container(
                        height: 80.0,
                        padding: EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                child: Text(nameResList[index].id.toString()),
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
                                    nameResList[index].name,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                      'alternative name: ${nameResList[index].alternativeName}'),
                                  Row(
                                    children: <Widget>[
                                      Text('Assignment Status:'),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      nameResList[index].isApproved != null
                                          ? Text(nameResList[index]
                                              .isApproved
                                              .toString())
                                          : Text('Pending')
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
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
