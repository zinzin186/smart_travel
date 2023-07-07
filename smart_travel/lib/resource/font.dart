import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FontStyle {
  regular,
  medium,
  semi,
  bold
}

extension FontStyleExtension on FontStyle {
  static final _fontWeights = {
    FontStyle.regular: FontWeight.normal,
    FontStyle.medium: FontWeight.w500,
    FontStyle.semi: FontWeight.w600,
    FontStyle.bold: FontWeight.w700
  };

  FontWeight get fontWeight => _fontWeights[this] ?? FontWeight.normal;
}

class AppTextStyle {
  AppTextStyle._();

  static const TextStyle titleViolation = TextStyle(
      color: Color(0xFF28505A),
      fontSize: 16,
      fontWeight: FontWeight.w700);
  static const TextStyle contentViolation = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500);
  static const TextStyle fineViolation = TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w700);

  static const TextStyle naviTitle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600);
  static const TextStyle font16Bold = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w800);
  static const TextStyle font12Regular = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w400);
  static const TextStyle font18Bold = TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w800);
  static const TextStyle font14Semi = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w600);
  static const TextStyle font25Bold = TextStyle(
      color: Colors.black38,
      fontSize: 25,
      fontWeight: FontWeight.w800);

  static TextStyle textStyle({required double fontSize, required FontStyle fontStyle, Color color = Colors.black38}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontStyle.fontWeight);
  }
}