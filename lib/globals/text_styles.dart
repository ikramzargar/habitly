import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitly/globals/colors.dart';

class AppTextStyles {
  static final TextStyle heading1 = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final TextStyle bodyText = GoogleFonts.montserrat(
    fontSize: 16,
    color: AppColors.grey,
    fontWeight: FontWeight.w700,

  );


}
