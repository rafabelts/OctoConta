import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/buttons_recuperacion.dart';
import 'package:octoconta_final/src/ui/olvido_contra/cambiar_contra/cambiar_contra_screen.dart';
import 'package:octoconta_final/src/ui/olvido_contra/codigo_verificacion/codigo_veri_inputs.dart';
import 'package:octoconta_final/src/ui/olvido_contra/ingresar_correo/ingresar_correo_veri_inputs.dart';

import '../ingresar_correo/ingresar_correo_veri_screen.dart';

class CodigoParaVerificar extends StatelessWidget {
  const CodigoParaVerificar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1),
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
                columnSpan: 12,
                child: Column(
                  children: <Widget>[
                    const CodigoParaVerificarInput(),
                    BotonesParaRecuperacion(
                        continuar: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CambioContrasena())),
                        textoBoton: "Continuar"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CorreoParaVerificar()));
                        },
                        child: Text(
                          'Reenviar codigo',
                          style: GoogleFonts.inter(
                            color: const Color(0xff4527A0),
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
