import 'package:flutter/material.dart';
import 'package:klass_korporate/screens/ngo_form.dart';

class NgoScreen extends StatelessWidget {
  static const String id = 'ngos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173366),
        title: Text('NGOs'),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, NgoForm.id);
        },
        backgroundColor:  Color(0xff173366) ,
        child: Icon(Icons.add,size: 40,),
      ),

    );
  }
}