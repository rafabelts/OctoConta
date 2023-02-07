import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/iva/iva_inputs.dart';

class CalculoIVAScreen extends StatelessWidget {
  const CalculoIVAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150.0),
        child: Column(
          children: <Widget>[
            const CalculoIvaInput(),
            Botones(
              limpiar: () {},
              calcular: () => mostrarResultados(context),
            ),
          ],
        ),
      ),
    );
  }
}
