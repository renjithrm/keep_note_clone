import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget text(String text, [int? maxLine]) {
  return Text(
    text,
    style: GoogleFonts.roboto(
      fontSize: 17,
    ),
    overflow: TextOverflow.ellipsis,
    maxLines: maxLine,
  );
}

Widget smallText(String text) {
  return Text(
    text,
    style: GoogleFonts.roboto(
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
    overflow: TextOverflow.ellipsis,
  );
}

Widget textFormField(
  TextEditingController? controller,
  String? Function(String?)? validator,
  String? hintText,
  TextInputType? keyboardType,
  bool obscureText,
) {
  return TextFormField(
    obscureText: obscureText,
    controller: controller,
    validator: validator,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(),
    ),
    keyboardType: keyboardType,
  );
}
