import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

errorMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Por favor ingrese valores validos',
        style: GoogleFonts.inter(
            color: Theme.of(context).scaffoldBackgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w500)),
    backgroundColor: const Color(0xFF2a195d),
  ));
}

showErrorMessage(BuildContext context, bool show) {
  show == true ? errorMessage(context) : null;
}
