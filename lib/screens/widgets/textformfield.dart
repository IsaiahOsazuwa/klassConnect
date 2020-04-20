import 'package:flutter/material.dart';
class MyCustomTextForm extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final Function onTap;
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  final int maxLine;
  final TextInputType textInputType;

  MyCustomTextForm({this.hintText, this.validator, this.onSaved, this.isPassword,
     this.textInputType ,this.onTap,this.textEditingController,this.outlineInputBorder,this.maxLine});
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(15.0),
        border: outlineInputBorder,
        filled: true,
        fillColor: Colors.white12,
      ),
      obscureText: isPassword?true:false,
      validator: validator,
      onSaved: onSaved,
      keyboardType:textInputType,
      onTap: onTap,
      controller: textEditingController,
      maxLines: maxLine,
    );
  }

}
