import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_font_weight.dart';
import 'package:clothers_store_app/app/theme/font_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle _textStyle(
      {required FontWeight fontWeight,
        required double fontSize,
        Color? color,
        bool? underLine}) {
    return GoogleFonts.nunitoSans(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color ?? blackDarker,
      decoration:
      underLine == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle loginBySignUpAgree = GoogleFonts.nunitoSans(
      fontSize: Get.width * 0.03,
      fontWeight: FontWeight.bold,
      color: Colors.black54);

  static TextStyle termCondition = GoogleFonts.nunitoSans(
    fontSize: Get.width * 0.03,
    fontWeight: FontWeight.bold,
    color: primaryColor,
    decoration: TextDecoration.underline,
  );

  static TextStyle appBarTextStyle1B({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.semiBold,
        fontSize: fontSize ?? AppFontSize.bodyText1FontSize,
        color: color);
  }

  static TextStyle bodyText1SB({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.semiBold,
        fontSize: fontSize ?? AppFontSize.bodyText1FontSize,
        color: color);
  }

  static TextStyle bodyText1B({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.bold,
        fontSize: fontSize ?? AppFontSize.bodyText1FontSize,
        color: color);
  }

  static TextStyle bodyText2SB({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.semiBold,
        fontSize: fontSize ?? AppFontSize.bodyText2FontSize,
        color: color);
  }

  static TextStyle bodyText2M({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.medium,
        fontSize: fontSize ?? AppFontSize.bodyText2FontSize,
        color: color);
  }

  static TextStyle bodyText3M({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.medium,
        fontSize: fontSize ?? AppFontSize.bodyText3FontSize,
        color: color);
  }

  static TextStyle bodyText3B({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.bold,
        fontSize: fontSize ?? AppFontSize.bodyText3FontSize,
        color: color);
  }

  static TextStyle bodyText3SB(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.semiBold,
        fontSize: fontSize ?? AppFontSize.bodyText3FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle bodyText4SB(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.semiBold,
        fontSize: fontSize ?? AppFontSize.bodyText4FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle bodyText4M(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.medium,
        fontSize: fontSize ?? AppFontSize.bodyText4FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle bodyText4B(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.bold,
        fontSize: fontSize ?? AppFontSize.bodyText4FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle bodyText5SB(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.semiBold,
        fontSize: fontSize ?? AppFontSize.bodyText5FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle bodyText5M({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.medium,
        fontSize: fontSize ?? AppFontSize.bodyText5FontSize,
        color: color);
  }

  static TextStyle bodyText5B({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.bold,
        fontSize: fontSize ?? AppFontSize.bodyText5FontSize,
        color: color);
  }

  static TextStyle heading1B({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.bold,
        fontSize: fontSize ?? AppFontSize.heading1FontSize,
        color: color);
  }

  static TextStyle heading2({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.bold,
        fontSize: fontSize ?? AppFontSize.heading2FontSize,
        color: color);
  }

  static TextStyle heading2SB(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.semiBold,
        fontSize: fontSize ?? AppFontSize.heading2FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle heading2B(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.bold,
        fontSize: fontSize ?? AppFontSize.heading2FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle bodyText6R({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.regular,
        fontSize: fontSize ?? AppFontSize.bodyText6FontSize,
        color: color);
  }

  static TextStyle bodyText6M(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.medium,
        fontSize: fontSize ?? AppFontSize.bodyText6FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle bodyText6SB(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.semiBold,
        fontSize: fontSize ?? AppFontSize.bodyText6FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle bodyText6B(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.bold,
        fontSize: fontSize ?? AppFontSize.bodyText6FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle heading1SB(
      {Color? color, double? fontSize, bool? underLine}) {
    return _textStyle(
        fontWeight: AppFontWeight.semiBold,
        fontSize: fontSize ?? AppFontSize.heading1FontSize,
        color: color,
        underLine: underLine);
  }

  static TextStyle heading3B({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.bold,
        fontSize: fontSize ?? AppFontSize.heading3FontSize,
        color: color);
  }

  static TextStyle heading3SB({Color? color, double? fontSize}) {
    return _textStyle(
        fontWeight: AppFontWeight.semiBold,
        fontSize: fontSize ?? AppFontSize.heading3FontSize,
        color: color);
  }

  static TextStyle buttonText3SB({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.semiBold,
      fontSize: AppFontSize.buttonText3FontSize,
      color: color,
    );
  }

  static TextStyle buttonText3B({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.bold,
      fontSize: AppFontSize.buttonText3FontSize,
      color: color,
    );
  }

  static TextStyle buttonText4SB({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.semiBold,
      fontSize: AppFontSize.buttonText4FontSize,
      color: color,
    );
  }

  static TextStyle buttonText4B({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.bold,
      fontSize: AppFontSize.buttonText4FontSize,
      color: color,
    );
  }

  static TextStyle extraHeading1B({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.bold,
      fontSize: AppFontSize.extraHeading1FontSize,
      color: color ?? blackBase,
    );
  }

  static TextStyle extraHeading1SB({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.semiBold,
      fontSize: AppFontSize.extraHeading1FontSize,
      color: color,
    );
  }

  static TextStyle extraHeading3B({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.bold,
      fontSize: AppFontSize.extraHeading3FontSize,
      color: color,
    );
  }

  static TextStyle extraHeading3SB({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.semiBold,
      fontSize: AppFontSize.extraHeading3FontSize,
      color: color,
    );
  }

  static TextStyle extraHeading4B({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.bold,
      fontSize: AppFontSize.extraHeading4FontSize,
      color: color,
    );
  }

  static TextStyle extraHeading4FB({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.fontBlack,
      fontSize: AppFontSize.extraHeading4FontSize,
      color: color,
    );
  }

  static TextStyle extraHeading4SB({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.semiBold,
      fontSize: AppFontSize.extraHeading4FontSize,
      color: color,
    );
  }

  static TextStyle extraHeading5B({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.bold,
      fontSize: AppFontSize.extraHeading5FontSize,
      color: color,
    );
  }

  static TextStyle extraHeading5FB({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.fontBlack,
      fontSize: AppFontSize.extraHeading5FontSize,
      color: color,
    );
  }

  static TextStyle extraHeading5SB({Color? color}) {
    return _textStyle(
      fontWeight: AppFontWeight.semiBold,
      fontSize: AppFontSize.extraHeading5FontSize,
      color: color,
    );
  }

  static appBarText(text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        text,
        textScaler: TextScaler.linear(1),
        style: AppTextStyle.extraHeading1B(color: Colors.white),
      ),
    );
  }
}
