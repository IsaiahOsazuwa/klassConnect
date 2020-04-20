import 'package:http/http.dart' as http;
import 'package:klass_korporate/model/classification_model.dart';
import 'package:klass_korporate/model/dashboard_model.dart';
import 'package:klass_korporate/model/reservationdetail_model.dart';
import 'package:klass_korporate/model/service_details_model.dart';
import 'package:klass_korporate/model/service_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:klass_korporate/model/name_resev_model.dart';
import 'package:klass_korporate/model/businessname_model.dart';

class Networking {
  String token;

  Future<void> authLogin({String email, String password}) async {
    var url = 'https://klasskorporate.com/api/login';
    http.Response response =
        await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = json.decode(data);
      token = decodedData['success']['token'];
      await setToken(token);
    } else {
      throw Exception('Failed auth');
    }
  }

  Future<void> authRegister(
      {String email,
      String password,
      String firstname,
      String lastname,
      String mobile,
      String cpassword}) async {
    var url = 'https://klasskorporate.com/api/register';
    http.Response response = await http.post(url, body: {
      'firstname': firstname,
      'lastname': lastname,
      'mobile_number': mobile,
      'password': password,
      'c_password': cpassword,
      'email': email
    });
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = json.decode(data);
      token = decodedData['success']['token'];
      await setToken(token);
    } else {
      throw Exception('Failed auth');
    }
  }

  Future<void> authLogout() async {
    var url = 'https://klasskorporate.com/api/logout';
    var response = await http.post(
      url,
    );
  }

  Future<void> postOther({String urls, Map<String, dynamic> map}) async {
    var url = urls;
    String header = await getToken();
    var body = json.encode(map);
    try {
      var response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $header',
      });
      var data = response.body;
    } catch (e) {
      print(e);
    }
  }

  Future<List> getCountriesList() async {
    List<String> countries = [];
    http.Response response =
        await http.get('https://klasskorporate.com/api/countries');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> decodedList = decodedData['data'];
      for (int i = 0; i < decodedList.length; i++) {
        String country = decodedList[i]['name'];
        countries.add(country);
      }
    }
    return countries;
  }

  Future<List> getNationalityList() async {
    List<String> nationalities = [];
    http.Response response =
        await http.get('https://klasskorporate.com/api/nationalities');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> decodedList = decodedData['data'];
      for (int i = 0; i < decodedList.length; i++) {
        String nationality = decodedList[i]['name'];
        nationalities.add(nationality);
      }
    }
    return nationalities;
  }

  Future<List> getStatesList() async {
    List<String> states = [];
    http.Response response =
        await http.get('https://klasskorporate.com/api/states');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> decodedList = decodedData['data'];
      for (int i = 0; i < decodedList.length; i++) {
        String state = decodedList[i]['name'];
        states.add(state);
      }
    }
    return states;
  }

  Future<List> getLocationList() async {
    List<String> locations = [];
    http.Response response =
        await http.get('https://klasskorporate.com/api/locations');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> decodedList = decodedData['data'];
      for (int i = 0; i < decodedList.length; i++) {
        String location = decodedList[i]['name'];
        locations.add(location);
      }
    }
    return locations;
  }

  Future<List<Classification>> getClassificationsList() async {
    List<Classification> classificationList = [];
    http.Response response =
        await http.get('https://klasskorporate.com/api/classifications');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> decodedList = decodedData['data'];
      for (int i = 0; i < decodedList.length; i++) {
        Classification classification =
            Classification.fromJason(decodedList[i]);
        classificationList.add(classification);
      }
    }
    return classificationList;
  }

  Future<List> getOccupationsList() async {
    List<String> occupations = [];
    http.Response response =
        await http.get('https://klasskorporate.com/api/occupations');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> decodedList = decodedData['data'];
      for (int i = 0; i < decodedList.length; i++) {
        String occupation = decodedList[i]['name'];
        occupations.add(occupation);
      }
    }
    return occupations;
  }

  Future<List> getDesignationsList() async {
    List<String> designations = [];
    http.Response response =
        await http.get('https://klasskorporate.com/api/designations');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> decodedList = decodedData['data'];
      for (int i = 0; i < decodedList.length; i++) {
        String designation = decodedList[i]['name'];
        designations.add(designation);
      }
    }
    return designations;
  }

  Future<List> getIdentityTypeList() async {
    List<String> identityTypes = [];
    http.Response response =
        await http.get('https://klasskorporate.com/api/identity-types');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> decodedList = decodedData['data'];
      for (int i = 0; i < decodedList.length; i++) {
        String identityType = decodedList[i]['name'];
        identityTypes.add(identityType);
      }
    }
    return identityTypes;
  }

  Future<List> getNatureOfBusinessList() async {
    List<String> natures = [];
    http.Response response =
        await http.get('https://klasskorporate.com/api/nature-of-businesses');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> decodedList = decodedData['data'];
      for (int i = 0; i < decodedList.length; i++) {
        String nature = decodedList[i]['name'];
        natures.add(nature);
      }
    }
    return natures;
  }

  Future<List> getReasonForSearchList() async {
    List<String> reasons = [];
    http.Response response =
        await http.get('https://klasskorporate.com/api/nature-of-businesses');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> decodedList = decodedData['data'];
      for (int i = 0; i < decodedList.length; i++) {
        String reason = decodedList[i]['name'];
        reasons.add(reason);
      }
    }
    return reasons;
  }

  Future<List> getDashStat() async {
    List dashStat;
    String url = 'https://klasskorporate.com/api/analytics';
    String header = await getToken();
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $header',
    });
    if (response.statusCode == 200) {
      dynamic decodedData = json.decode(response.body);
      DashBoardStats dashBoardStats = DashBoardStats.fromJson(decodedData);
      dashStat = [
        dashBoardStats.nameReservation,
        dashBoardStats.companyRegistration,
        dashBoardStats.businessNameRegistration
      ];
    }
    return dashStat;
  }

  Future<List<Services>> getServiceData() async {
    List<Services> serviceList = [];
    String url = 'https://klasskorporate.com/api/orders';
    String header = await getToken();
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $header',
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> data = decodedData['data'];
      print('Service data is $data');
      for (int i = 0; i < data.length; i++) {
        Services services = Services.fromJason(data[i]);
        if (services.serviceRequested != null) {
          serviceList.add(services);
        }
      }
    }
    return serviceList;
  }

  Future<List<NameReservation>> getNameResData() async {
    List<NameReservation> nameResList = [];
    String url = 'https://klasskorporate.com/api/reservations';
    String header = await getToken();
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $header',
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> data = decodedData['data'];
      for (int i = 0; i < data.length; i++) {
        NameReservation nameReservation = NameReservation.fromJason(data[i]);
        nameResList.add(nameReservation);
      }
    }
    return nameResList;
  }

  Future<ReservationDetails> getReservationDetails(int id) async {
    ReservationDetails details;
    String url = 'https://klasskorporate.com/api/reservations/$id';
    String header = await getToken();
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $header',
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      Map<String, dynamic> data = decodedData['data'];
      ReservationDetails reservationDetails =
          ReservationDetails.fromJason(data);
      details = reservationDetails;
    }
    return details;
  }
  Future<ServiceDetails> getServiceDetails(int id) async {
    ServiceDetails details;
    String url = 'https://klasskorporate.com/api/orders/$id';
    String header = await getToken();
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $header',
    });
    print(response.body);
    if(response.statusCode == 200){
      Map<String, dynamic> decodedData = json.decode(response.body);
      Map<String, dynamic> data = decodedData['data'];
      ServiceDetails serviceDetails = ServiceDetails.fromJason(data);
      details = serviceDetails;
    }
    return details;
  }

  Future<List<BusinessName>> getBusinessNameData() async {
    List<BusinessName> businessNameList = [];
    String url = 'https://klasskorporate.com/api/business-name-registrations';
    String header = await getToken();
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $header',
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> data = decodedData['data'];
      for (int i = 0; i < data.length; i++) {
        BusinessName businessName = BusinessName.fromJason(data[i]);
        businessNameList.add(businessName);
      }
    }
    return businessNameList;
  }

  Future<void> getCompanyData() async {
    String url = 'https://klasskorporate.com/api/companies';
    String header = await getToken();
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $header',
    });
    print(response.body);
//    if (response.statusCode == 200) {
//      Map<String, dynamic> decodedData = json.decode(response.body);
//      //List<dynamic> data = decodedData['data'];
//      return decodedData;
//    }
  }

  Future<dynamic> getNGOData() async {
    String url = 'https://klasskorporate.com/api/trustees';
    String header = await getToken();
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $header',
    });
    print(response.body);
//    if (response.statusCode == 200) {
//      Map<String, dynamic> decodedData = json.decode(response.body);
//      //List<dynamic> data = decodedData['data'];
//      return decodedData;
//    }
  }

  Future<dynamic> deleteService(int serviceId)async{
    String url = 'https://klasskorporate.com/api/orders/$serviceId';
    dynamic response = await http.delete(url);
    print('delete response is $response');
  }

  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
