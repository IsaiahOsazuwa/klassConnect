import 'package:flutter/material.dart';
import 'package:klass_korporate/screens/company_profiling_form.dart';

class CompanyProfilingScreen extends StatelessWidget {
  static const String id = 'company_prof';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173366),
        title: Text('Company Profiling'),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, CompanyProfilingForm.id);
        },
        backgroundColor:  Color(0xff173366) ,
        child: Icon(Icons.add,size: 40,),
      ),

    );
  }
}