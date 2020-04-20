import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klass_korporate/model/dashboard_model.dart';
import 'package:klass_korporate/screens/business_name.dart';
import 'package:klass_korporate/screens/business_plan.dart';
import 'package:klass_korporate/screens/company.dart';
import 'package:klass_korporate/screens/company_prof.dart';
import 'package:klass_korporate/screens/login_screen.dart';
import 'package:klass_korporate/screens/multipurpose.dart';
import 'package:klass_korporate/screens/name_reserve.dart';
import 'package:klass_korporate/screens/ngos.dart';
import 'package:klass_korporate/screens/service_sceen.dart';
import 'package:klass_korporate/screens/update_prof.dart';
import 'package:klass_korporate/model/service_model.dart';
import 'package:klass_korporate/services/networking.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Networking networking = Networking();
  DashBoardStats dashBoardStats = DashBoardStats();
  Services services = Services();
  List<IconData> dashIcons = [
    Icons.add_location,
    Icons.contact_phone,
    Icons.domain
  ];
  List<String> dashtitle = [
    'Name Reservation Request',
    'Company Registration Request',
    'Business Name Registration'
  ];
  List<Color> dashIconsColors = [
    Color(0xFF5BB6E5),
    Color(0xFFEA6C9C),
    Color(0XFF5CBCAD)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    networking.getCountriesList();
    networking.getDashStat();
    networking.getServiceData();
    networking.getNameResData();
    networking.getBusinessNameData();
    networking.getCompanyData();
    networking.getIdentityTypeList();
    networking.getReasonForSearchList();
    networking.getClassificationsList();
    networking.getNatureOfBusinessList();
    networking.getNationalityList();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173366),
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: null),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            color: Color(0xff173366),
            height: 50.0,
            width: double.infinity,
            child: Text(
              'Klass & Koporate Int\'l Limited',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                child: FutureBuilder(
                    future: networking.getDashStat(),
                    builder: (BuildContext context, AsyncSnapshot snap) {
                      if (snap.hasData) {
                        List stats = snap.data;
                        return ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext _, int index) {
                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              elevation: 8.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 60.0,
                                      child: CircleAvatar(
                                        radius: 40.0,
                                        backgroundColor: dashIconsColors[index],
                                        child: Icon(
                                          dashIcons[index],
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      width: 170,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: Text(
                                                stats[index].toString(),
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 40.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              dashtitle[index],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
          ),
          Expanded(
            flex: 3,
            child: MyServiceOrderScreen(),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: UserAccountsDrawerHeader(
                accountName: Text('Hello Isaiah'),
                accountEmail: Text('osazuwaisaiah@gmail.com'),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Dashboard'),
                      leading: Icon(
                        Icons.dashboard,
                        color: Colors.blue,
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, NameReservationScreen.id);
                      },
                      child: ListTile(
                        title: Text('Name Reservation'),
                        leading: Icon(
                          Icons.add_location,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, BusinessNameScreen.id);
                      },
                      child: ListTile(
                        title: Text('Business Name'),
                        leading: Icon(
                          Icons.domain,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CompanyScreen.id);
                      },
                      child: ListTile(
                        title: Text('Company'),
                        leading: Icon(
                          Icons.contact_phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, NgoScreen.id);
                      },
                      child: ListTile(
                        title: Text('NGOs'),
                        leading: Icon(
                          Icons.account_balance,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MultiPurposeScreen.id);
                      },
                      child: ListTile(
                        title: Text('MultiPurpose'),
                        leading: Icon(
                          Icons.settings_input_composite,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, BusinessPlanScreen.id);
                      },
                      child: ListTile(
                        title: Text('Business Plan'),
                        leading: Icon(
                          Icons.collections_bookmark,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CompanyProfilingScreen.id);
                      },
                      child: ListTile(
                        title: Text('Company Profiling'),
                        leading: Icon(
                          Icons.compare,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, UpdateProfileScreen.id);
                      },
                      child: ListTile(
                        title: Text('Update Profile'),
                        leading: Icon(
                          Icons.account_box,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: GestureDetector(
                  onTap: () async {
                    try {
                      await networking.authLogout();
                      Navigator.pushReplacementNamed(context, LoginScreen.id);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: ListTile(
                    title: Text('Log Out'),
                    leading: Icon(
                      Icons.power_settings_new,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
