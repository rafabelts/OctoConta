import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/tarjeta/tarjeta_inputs.dart';

class CalculoTarjetaScreen extends StatelessWidget {
  const CalculoTarjetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: <Widget>[
            const CalculoTarjetaInput(),
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
