import 'package:flutter/material.dart';
import 'package:netive_code_demo/values/style.dart';

import 'colors.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColor.primaryColor,
  scaffoldBackgroundColor: const Color(0xfff9f9f9),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: false,
  appBarTheme: AppBarTheme(
    color: AppColor.primaryColor,
    iconTheme: const IconThemeData(color: AppColor.white, size: 30.0),
    toolbarTextStyle: TextTheme(
      titleLarge: textBold,
    ).bodyMedium,
    titleTextStyle: TextTheme(
      titleLarge: textBold,
    ).titleLarge,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColor.textBackgroundColor,
    disabledColor: AppColor.textBackgroundColor,
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColor.brownColor),
);
