import 'package:flutter/material.dart';

const whiteColor = Color(0xffFAFAFA);
const yellowColor = Color(0xffFAD431);
const yellowShadowColor = Color(0xffFFEE63);
const OrangeTextColor =Color(0xffF53739);
const blackColor = Color(0xff000000);


 const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  prefixIconColor: Colors.red,
  contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: yellowShadowColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(35.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: yellowColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(35.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffD32F2F), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(35.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffD32F2F), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(35.0)),
  ),
);

const defaultImagePath="http://www.goodmorningimagesdownload.com/wp-content/uploads/2020/05/No-Whatsapp-Dp-Images-6.jpg";
