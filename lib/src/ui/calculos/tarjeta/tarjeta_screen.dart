import 'package:flutter/material.dart';
import 'package:octoconta_final/src/ui/calculos/buttons_calculos.dart';
import 'package:octoconta_final/src/ui/calculos/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/tarjeta/tarjeta_inputs.dart';

class CalculoTarjetaScreen extends StatelessWidget {
  const CalculoTarjetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: <Widget>[
            const CalculoTarjetaInput(),
            BotonesCalculos(
              limpiar: () {},
              calcular: () => mostrarResultados(context),
            ),
          ],
        ),
      ),
    );
  }
}
