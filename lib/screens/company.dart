import 'package:flutter/material.dart';
import 'package:klass_korporate/screens/company_form.dart';

class CompanyScreen extends StatelessWidget {
  static const String id = 'company';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173366),
        title: Text('Company'),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, CompanyForm.id);
        },
        backgroundColor:  Color(0xff173366) ,
        child: Icon(Icons.add,size: 40,),
      ),

    );
  }
}