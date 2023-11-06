import 'package:flutter/material.dart';

const kInputTextFieldDecorationStyle = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(width: 1.0, style: BorderStyle.solid),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(width: 1.0, style: BorderStyle.solid),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(width: 1.5, style: BorderStyle.solid),
  ),
);

const kDropDownButtonDecoration = ShapeDecoration(
  shape: RoundedRectangleBorder(
    side: BorderSide(width: 1.0, style: BorderStyle.solid),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
