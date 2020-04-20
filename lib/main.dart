import 'package:flutter/material.dart';
import 'package:klass_korporate/screens/business_name.dart';
import 'package:klass_korporate/screens/business_name_form.dart';
import 'package:klass_korporate/screens/business_plan.dart';
import 'package:klass_korporate/screens/business_plan_form.dart';
import 'package:klass_korporate/screens/company.dart';
import 'package:klass_korporate/screens/company_form.dart';
import 'package:klass_korporate/screens/company_prof.dart';
import 'package:klass_korporate/screens/company_profiling_form.dart';
import 'package:klass_korporate/screens/home.dart';
import 'package:klass_korporate/screens/login_screen.dart';
import 'package:klass_korporate/screens/multipurpose.dart';
import 'package:klass_korporate/screens/name_reserve.dart';
import 'package:klass_korporate/screens/name_reserve_form.dart';
import 'package:klass_korporate/screens/namereservedetails_screen.dart';
import 'package:klass_korporate/screens/ngo_form.dart';
import 'package:klass_korporate/screens/ngos.dart';
import 'package:klass_korporate/screens/payment.dart';
import 'package:klass_korporate/screens/registration_screen.dart';
import 'package:klass_korporate/screens/service_sceen.dart';
import 'package:klass_korporate/screens/update_prof.dart';
import 'package:klass_korporate/screens/widgets/multipurpose_form.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff173366),
      ),
      initialRoute: LoginScreen.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProfileScreen.id: (context) => UpdateProfileScreen(),
        NgoScreen.id: (context) => NgoScreen(),
        NgoForm.id: (context) => NgoForm(),
        CompanyProfilingScreen.id: (context) => CompanyProfilingScreen(),
        CompanyProfilingForm.id: (context) => CompanyProfilingForm(),
        MultiPurposeScreen.id: (context) => MultiPurposeScreen(),
        MultipurposeForm.id: (context) => MultipurposeForm(),
        BusinessPlanScreen.id: (context) => BusinessPlanScreen(),
        BusinessPlanForm.id: (context) => BusinessPlanForm(),
        NameReservationScreen.id: (context) => NameReservationScreen(),
        BusinessNameScreen.id: (context) => BusinessNameScreen(),
        BusinessNameForm.id: (context) => BusinessNameForm(),
        MyServiceOrderScreen.id: (context) => MyServiceOrderScreen(),
        CompanyScreen.id: (context) => CompanyScreen(),
        CompanyForm.id: (context) => CompanyForm(),
        LoginScreen.id: (context) => LoginScreen(),
        NameReserveForm.id: (context) => NameReserveForm(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        PaymentPage.id: (context) => PaymentPage(),
        // NameReserveDetails.id: (context)=> NameReserveDetails(),
      },
    ),
  );
}
