import 'package:flutter/material.dart';
import 'package:klass_korporate/screens/business_plan_form.dart';

class BusinessPlanScreen extends StatelessWidget {
  static const String id = 'business_plan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173366),
        title: Text('Business plan'),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, BusinessPlanForm.id);
        },
        backgroundColor:  Color(0xff173366) ,
        child: Icon(Icons.add,size: 40,),
      ),

    );
  }
}