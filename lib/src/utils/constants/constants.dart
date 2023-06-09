import 'package:flutter/material.dart';

const kPrimaryColor = Color(0XFF6A87F3);
const kSecondaryColor = Color(0XFF988BE8);
const kScaffoldColor = Color(0XFF4F6CD5);
const kredColor = Color(0xffe88b87);
const kblueColor = Color(0xff75cdff);
const kredDarkColor = Color(0xffdb736e);
const kredBehindTextColor = Color(0xffdb726e);
const kTextColor = Color(0XFF1D1D1F);
const kTextGreyColor = Color(0xffb6bbc8);
const kTextFieldFillColor = Color(0xffF7F8F9);
const kTextFieldContentColor = Color(0xffADB6C1);
const kTextFieldBorderColor = Color(0xffECEFF5);
const kCyanLightColor = Color(0xffd5eeee);
const kGrayCardColor = Color(0xfff7f8f9);

const kHeadingFontSize = 28.0;

bool isPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

double kWidth(BuildContext context) => MediaQuery.of(context).size.width;
double kHeight(BuildContext context) => MediaQuery.of(context).size.height;

class ScreenName {
  static const authentication = '/';
  static const updateAccount = '/updateAccount';
  static const home = '/home';
  static const notificationView = '/notificationView';
  static const fitUiNavigator = '/FITUINavigator';
  static const fitCommittee = '/fitCommittee';
  static const winnersVIew = '/winnersView';
}
