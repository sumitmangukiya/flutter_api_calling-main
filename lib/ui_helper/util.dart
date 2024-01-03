import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:ui';

class AppColor {
  static const Color pink_color = Color(0xFFD81B60);
  static const Color white_color = Color(0xffffffff);
}

TextStyle mTextStyle20() {
  return TextStyle(
    fontFamily: 'PoppinsMide',
    fontSize: 20,
    color: AppColor.white_color,
  );
}

TextStyle mTextStyle16() {
  return TextStyle(
    fontFamily: 'PoppinsSemi',
    fontSize: 16,
    color: AppColor.white_color,
  );
}

AppBar mAppBar(BuildContext context, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: AppColor.pink_color,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: AppColor.white_color,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      title,
      style: mTextStyle20(),
    ),
  );
}
