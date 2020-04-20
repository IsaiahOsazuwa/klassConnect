import 'package:flutter/material.dart';
import 'package:klass_korporate/screens/widgets/multipurpose_form.dart';

class MultiPurposeScreen extends StatelessWidget {
  static const String id = 'multipurpose';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173366),
        title: Text('MultiPurpose'),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, MultipurposeForm.id);
        },
        backgroundColor:  Color(0xff173366) ,
        child: Icon(Icons.add,size: 40,),
      ),

    );
  }
}