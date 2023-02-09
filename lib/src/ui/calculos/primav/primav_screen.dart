import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/conversion_sueldo.dart';
import 'package:octoconta_final/src/models/dropdown_salario.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/models/tiempo_vacaciones.dart';
import 'package:octoconta_final/src/ui/calculos/primav/prima_resultados_items.dart';
import 'package:octoconta_final/src/ui/calculos/primav/primav_inputs.dart';

class CalculoPrimaVacacionalScreen extends StatefulWidget {
  const CalculoPrimaVacacionalScreen({super.key});

  @override
  State<CalculoPrimaVacacionalScreen> createState() =>
      _CalculoPrimaVacacionalScreenState();
}

class _CalculoPrimaVacacionalScreenState
    extends State<CalculoPrimaVacacionalScreen> {
  TextEditingController year = TextEditingController();
  TextEditingController sueldo = TextEditingController();

  @override
  void initState() {
    super.initState();
    year;
    sueldo;
  }

  @override
  void dispose() {
    super.dispose();
    year;
    sueldo;
  }

  bool esNumeroYear = true;
  bool esNumeroSueldo = true;

  setValidator(valid, valid1) {
    setState(() {
      esNumeroYear = valid;
      esNumeroSueldo = valid1;
    });
  }

  onChanged() {
    if (year.text.isEmpty) {
      setValidator(false, false);
    } else if (sueldo.text.isEmpty) {
      setValidator(true, false);
    } else {
      setValidator(true, true);
    }
  }

  onCompleteYear() {
    if (year.text.isEmpty) {
      setValidator(false, false);
    } else {
      setValidator(true, false);
      FocusScope.of(context).nextFocus();
    }
  }

  onCompleteSueldo() {
    if (sueldo.text.isEmpty) {
      setValidator(true, false);
    } else {
      setValidator(true, true);
      FocusScope.of(context).unfocus();
      TextInputAction.done;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> periodosPago = ['Anual', 'Mensual', 'Semanal', 'Diario'];
    String periodoActual = periodosPago[1];

    String diasVacaciones = '';
    String primaVacacional = '';
    double salarioConvertido = 0;

    double calculoPrimaVacacional() {
      double conversion =
          convertirSueldo(sueldo, periodoActual, salarioConvertido);

      String dias = calcularTiempo(year, diasVacaciones);
      double totalPrimaVacacional = (conversion * int.parse(dias)) * 0.25;

      if (totalPrimaVacacional == 0) {
        primaVacacional = 'No aplica';
        primaVacacional = 'No aplica';
      } else {
        primaVacacional = totalPrimaVacacional.toStringAsFixed(2);
      }
      return double.parse(dias);
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: <Widget>[
            CalculoPrimaVacacionalInput(
              year: year,
              sueldo: sueldo,
              esNumeroYear: esNumeroYear,
              esNumeroSueldo: esNumeroSueldo,
              onChanged: (value) => onChanged(),
              onCompleteYear: onCompleteYear,
              onCompleteSueldo: onCompleteSueldo,
            ),
            DropdownPeriodoSalario(
              periodoActual: periodoActual,
              periodos: periodosPago,
            ),
            Botones(limpiar: () {
              year.clear();
              sueldo.clear();
            }, calcular: () {
              FocusScope.of(context).unfocus();
              if (year.text.isEmpty) {
                setValidator(false, false);
              } else if (sueldo.text.isEmpty) {
                setValidator(true, false);
              } else {
                setValidator(true, true);
                calculoPrimaVacacional();
                diasVacaciones = calculoPrimaVacacional().toString();
                mostrarResultados(
                    context,
                    ResultadosPrimaVacacionalItems(
                        diasVacaciones: diasVacaciones,
                        cantidadPrimaRedondeado: primaVacacional == 'No aplica'
                            ? 'No aplica'
                            : '\$$primaVacacional'));
              }
            }),
          ],
        ),
      ),
    );
  }
}
