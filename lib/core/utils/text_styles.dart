import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
      height: 26 / 14,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
      height: 28 / 16,
    );
  }

  static TextStyle styleSemiBold12(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
      height: 22 / 12,
    );
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
      height: 26 / 14,
    );
  }

  static TextStyle styleBold12(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
      height: 22 / 12,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
      height: 28 / 16,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w400,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
      height: 32 / 20,
    );
  }

  static TextStyle styleMedium12(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w500,
      fontFamily: 'Cairo',
      height: 22 / 12,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
      height: 30 / 18,
    );
  }

  static TextStyle styleLight14(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w300,
      fontFamily: 'Cairo',
      height: 24 / 14,
    );
  }

  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
      height: 36 / 24,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
      height: 32 / 20,
    );
  }

  static TextStyle styleSemiBoldAlexandria12(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w600,
      fontFamily: 'Alexandria',
    );
  }
}

double getResoponsiveFontSize(BuildContext context,
    {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFotSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFotSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  return width / 400;
}
