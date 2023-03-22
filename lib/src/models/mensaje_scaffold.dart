import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class MensajeScaffold {
  final BuildContext contexto;
  final String mensaje;

  mostrar() {
    ScaffoldMessenger.of(contexto).showSnackBar(SnackBar(
      content: Text(mensaje,
          style: GoogleFonts.inter(
              color: Theme.of(contexto).scaffoldBackgroundColor,
              fontSize: 16,
              fontWeight: FontWeight.w500)),
      backgroundColor: primario,
    ));
  }

  MensajeScaffold({required this.contexto, required this.mensaje});
}
