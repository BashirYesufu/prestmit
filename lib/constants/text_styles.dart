import 'color_path.dart';
import 'package:flutter/material.dart';
import 'font_path.dart';

class AppTextStyles {

  static TextStyle yellow(double size, {FontWeight weight = FontWeight.normal}) => TextStyle(
      color: ColorPath.yellow,
      fontSize: size,
      fontWeight: weight,
      fontFamily: FontPath.inter
  );
  static TextStyle generic({required double size, Color? color, FontWeight weight = FontWeight.normal}) => TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
      fontFamily: FontPath.inter
  );

  static TextStyle black(double size, {FontWeight weight = FontWeight.normal}) => TextStyle(
      color: Colors.black,
      fontSize: size,
      fontWeight: weight,
      fontFamily: FontPath.inter
  );
}

