import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  static const String id = 'update_prof';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173366),
        title: Text('Update Profile'),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor:  Color(0xff173366) ,
        child: Text('New'),
      ),

    );
  }
}