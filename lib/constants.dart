import 'package:flutter/material.dart';

const kPrimaryColor = Color(0XFF4F6CD5);
const kSecondaryColor = Color(0XFF988BE8);
const kTextColor = Color(0XFF1D1D1F);
const kTextGreyColor = Color(0XFF666872);
// const kTextFieldColor = Color(0XFFE7EAEE);
const kCyanLightColor = Color(0xffd5eeee);
const kRedColor = Color(0xffE4516B);
const kTextFieldColor = Color(0xffF7F8F9);
bool isPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

double kWidth(BuildContext context) => MediaQuery.of(context).size.width;
double kHeight(BuildContext context) => MediaQuery.of(context).size.height;
