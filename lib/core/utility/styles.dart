





import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles{
  static final TextStyle titleMedium = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.white,
    decoration:TextDecoration.none,

  );
  static const textStyle18=TextStyle(
fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textStyle30=TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
  static const textStyle24=TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );


}