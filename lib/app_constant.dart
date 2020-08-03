import 'package:flutter/material.dart';

class AppConstant {
  static const String applicationName = 'Covid Summary';
  static const String imageSource = 'assets/images';

  // Colors
  static const Color primaryColor = Color(0xff6200ee);
  static const Color secondaryColor = Color(0xff448aff);
  static const Color mainTextColor = Color(0xfffcf8fa);
  static const Color secondTextColor = Color(0xff556070);

  // Text styles
  static const TextStyle categoryTitle = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );
  static const TextStyle tableHeaderColor = TextStyle(
    color: AppConstant.secondaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  static const TextStyle categoryBoxTextColor = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );

  // Images
  static String manWithLaptopImage = '$imageSource/man_with_laptop.jpg';
}
