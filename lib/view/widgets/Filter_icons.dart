import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

Column filers(String icon, String title) {
  return Column(
    children: [
      Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          color: const Color(0xff51535E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: SvgPicture.asset(
            "asstes/${icon}.svg",
            color: Colors.white,
            allowDrawingOutsideViewBox: false,
            width: 26,
            height: 26,
          ),

       
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(title,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Color(0xFFA0A0A0)),
          )),
    ],
  );
}
