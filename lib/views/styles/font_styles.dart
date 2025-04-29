import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  static TextStyle largerText(Color textColor) => GoogleFonts.play(
    fontSize: 36.r,
    fontWeight: FontWeight.w800,
    color: textColor,
  );

  static TextStyle largeText(Color textColor) => GoogleFonts.play(
    fontSize: 36.r,
    fontWeight: FontWeight.w800,
    color: textColor,
  );

  static TextStyle mediumText(Color textColor) => GoogleFonts.play(
    fontSize: 24.r,
    fontWeight: FontWeight.w500,
    color: textColor,
  );

  static TextStyle medium2Text(Color textColor) => GoogleFonts.play(
    fontSize: 24.r,
    fontWeight: FontWeight.w800,
    color: textColor,
  );

  static TextStyle smallText(Color textColor) => GoogleFonts.play(
    fontSize: 18.r,
    fontWeight: FontWeight.w500,
    color: textColor,
  );

  static TextStyle smallboldText(Color textColor) => GoogleFonts.play(
    fontSize: 18.r,
    fontWeight: FontWeight.w900,
    color: textColor,
  );

  static TextStyle smallBoldText = GoogleFonts.play(
    fontSize: 16.r,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static TextStyle smallerBoldText(Color textColor) => GoogleFonts.play(
    fontSize: 16.r,
    fontWeight: FontWeight.w800,
    color: textColor,
  );

  static TextStyle smallerText(Color textColor) => GoogleFonts.play(
    fontSize: 14.r,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static TextStyle smallestText(Color textColor) => GoogleFonts.play(
    fontSize: 10.r,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static TextStyle textfieldText = GoogleFonts.play(
    fontSize: 24.r,
    fontWeight: FontWeight.w500,
    color: Colors.green,
  );

  static TextStyle loginhintText = GoogleFonts.play(
    fontSize: 14.r,
    fontWeight: FontWeight.w400,
    color: Colors.green,
  );
}
