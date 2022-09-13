import 'package:flutter/material.dart';
import 'package:soq_app/presentation/recources/fonts_manger.dart';

TextStyle _getTextStyle(
  double fontSize,
  Color color,
  FontWeight fontWeight,
) {
  return TextStyle(
    fontFamily: FontConstant.fontFamily,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getLightStyle({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(fontSize, color, FontWaightManger.light);
}

TextStyle getRegularStyle({
  double fontSize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(fontSize, color, FontWaightManger.regular);
}

TextStyle getMediumStyle({
  double fontSize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(fontSize, color, FontWaightManger.medium);
}

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(fontSize, color, FontWaightManger.semiBold);
}

TextStyle getBoldStyle({
  double fontSize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(fontSize, color, FontWaightManger.bold);
}
