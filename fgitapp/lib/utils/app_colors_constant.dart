import 'package:flutter/material.dart';

class AppColors {
  static const Color bgColor = Colors.white;

  static const Color errorColor = Colors.red;
  static const Color errorLightColor = Color.fromARGB(255, 236, 185, 182);

  static const Color successColor = Colors.green;
  static const Color successLightColor = Color.fromARGB(255, 204, 233, 205);

  static const Color primaryColor = Colors.blue;

  static const Color labelDark = Color(0xff034f9e);

  static const Color btnColor = Color(0xff044a92);

  static const Color labelLight = Colors.blue;

  static const Color unselectedColor = Color(0x9a3a4044);

  static const Color iconColor = Color(0xff034f9e);

  static const Color normalBodyTextColor = Colors.black;

  static const Color appThemeColor = Color(0xff034f9e);
  static const Color appThemeLightColor = Color.fromARGB(38, 25, 118, 210);

  static const Color appBarColor = Colors.white;

  static const Color labelCardCircleColor = Color(0x0f4c5252);

  static const Color shadowColor = Color(0xffd9cdcd);
  static const Color greyColor = Color.fromARGB(255, 255, 255, 255);

  static const Color darkGreyColor = Colors.grey;

  static const Color authBtnColor = Color.fromARGB(255, 30, 136, 229);

  static const Color whiteColor = Colors.white;
  static const Color redColor = Colors.red;
  static const Color redLightColor = Color(0xffef5350);
  //status color

  static const Color defaultStatusColor = Color(0xff034f9e);

  static const gradiant = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      appThemeLightColor,
      AppColors.appThemeColor,
    ],
  );
}
