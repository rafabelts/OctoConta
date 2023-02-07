import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/prestamo/prestamo_inputs.dart';

import '../../../models/buttons_calculos.dart';

class CalculoPrestamoScreen extends StatelessWidget {
  const CalculoPrestamoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: <Widget>[
            const CalculoPrestamoInput(),
            Botones(
              limpiar: () {},
              calcular: () => mostrarResultados(
                  context,
                  Column(
                    children: [],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
