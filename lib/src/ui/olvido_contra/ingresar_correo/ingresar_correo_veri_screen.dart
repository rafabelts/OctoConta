import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_recuperacion.dart';
import 'package:octoconta_final/src/ui/olvido_contra/ingresar_correo/ingresar_correo_veri_inputs.dart';

import '../codigo_verificacion/codigo_veri_screen.dart';

class CorreoParaVerificar extends StatelessWidget {
  const CorreoParaVerificar({super.key});

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
                    const CorreoParaVerificarInput(),
                    BotonesParaRecuperacion(
                      continuar: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CodigoParaVerificar())),
                      textoBoton: "Enviar codigo",
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
