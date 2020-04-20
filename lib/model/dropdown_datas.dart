import 'package:flutter/material.dart';

List<String> genderList = ['Male', 'Female'];

List<String> avaliabilityCodeList = ['Yes', 'No'];

List<String> businessTypeList = ['Product', 'Services','Product & Services'];

InputDecoration dropDownDecoration = InputDecoration(
    contentPadding: EdgeInsets.all(4), border: OutlineInputBorder());

getList(List itemList) {
  List<DropdownMenuItem<String>> dropdownItems = [];
  for (String item in itemList) {
    var newItem = DropdownMenuItem(
      child: Text(item),
      value: item,
    );
    dropdownItems.add(newItem);
  }
  return dropdownItems;
}
