import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget text(String text) {
  return Text(
    text,
    style: GoogleFonts.roboto(
      fontSize: 17,
    ),
    overflow: TextOverflow.ellipsis,
  );
}
