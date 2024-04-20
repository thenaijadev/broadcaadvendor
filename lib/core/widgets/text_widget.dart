import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal,
      this.color = AppColors.black,
      this.textAlign,
      this.overflow,
      this.onTap,
      this.textDecoration,
      this.letterSpacing});
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onTap;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign,
        overflow: overflow,
        style: GoogleFonts.montserrat(
            color: color,
            decoration: textDecoration,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing),
      ),
    );
  }
}
