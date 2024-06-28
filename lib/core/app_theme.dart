

import 'package:flutter/material.dart';
import 'package:lilac_mvvm_user/core/app_dimensions.dart';

import 'app_string.dart';
import 'app_style.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    primaryColor: Color(0xff370617),
    scaffoldBackgroundColor: Color(0xFFF8F8FA),
    cardColor: Color(0xffffffff),
    indicatorColor: Color(0xffd93030),
    hintColor: Color(0xFFB0B0B0),
    appBarTheme: const AppBarTheme(
      color: Color(0xff370617),
      centerTitle: true,
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xff370617), width: 0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.RADIUS_DEFAULT),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        border: inputBorder),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff370617)
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor:Color(0xff370617),
    ),
    fontFamily: AppString.appFont,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xff370617),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Color(0xff370617)),
        ),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.grey, width: 2),
      ),
      dialHandColor: const Color(0xff370617),
      hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? const Color(0xff370617)
          : Colors.black12),
      hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? Colors.black54
          : Colors.grey),
      dayPeriodBorderSide: const BorderSide(color: Colors.grey),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      dayPeriodColor: Colors.transparent,
      dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? const Color(0xff370617)
          : Colors.black12),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black12),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    ),
  );
}
