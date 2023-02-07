import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/dropdown_salario.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/isr/isr_inputs.dart';

class CalculoISRScreen extends StatelessWidget {
  const CalculoISRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> periodosPago = ['Anual', 'Mensual', 'Semanal', 'Diario'];
    String periodoActual = periodosPago[1];
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: <Widget>[
            const CalculoIsrInput(),
            DropdownPeriodoSalario(
                periodoActual: periodoActual, periodos: periodosPago),
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
