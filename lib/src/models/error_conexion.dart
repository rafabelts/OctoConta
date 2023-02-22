import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

errorMessage(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(error,
        style: GoogleFonts.inter(
            color: Theme.of(context).scaffoldBackgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w500)),
    backgroundColor: const Color(0xff4527A0),
    elevation: 10.0,
  ));
}

showErrorMessageConexion(BuildContext context, bool show, String error) {
  show == true ? errorMessage(context, error) : null;
}
