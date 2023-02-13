import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/conversion_sueldo.dart';
import 'package:octoconta_final/src/models/dropdown_salario.dart';
import 'package:octoconta_final/src/models/error_calculando.dart';
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

  setValidador(valid, valid1) {
    setState(() {
      esNumeroYear = valid;
      esNumeroSueldo = valid1;
    });
  }

  onChanged() {
    showErrorMessage(context, false);
    if (year.text.isEmpty) {
      sueldo.text.isEmpty
          ? setValidador(false, false)
          : setValidador(false, true);
    } else {
      sueldo.text.isEmpty
          ? setValidador(true, false)
          : setValidador(true, true);
    }
  }

  onCompleteYear() {
    if (year.text.isEmpty) {
      sueldo.text.isEmpty
          ? setValidador(false, false)
          : setValidador(false, true);
    } else {
      if (sueldo.text.isEmpty) {
        setValidador(true, false);
        FocusScope.of(context).nextFocus();
      } else {
        setValidador(true, true);
        FocusScope.of(context).nextFocus();
      }
    }
  }

  onCompleteSueldo() {
    if (sueldo.text.isEmpty) {
      year.text.isEmpty
          ? setValidador(false, false)
          : setValidador(true, false);
    } else {
      if (year.text.isEmpty) {
        setValidador(false, true);
        FocusScope.of(context).unfocus();
      } else {
        setValidador(true, true);
        FocusScope.of(context).unfocus();
      }
    }
  }

  listo() {
    FocusScope.of(context).unfocus();
    if (year.text.isEmpty) {
      sueldo.text.isEmpty
          ? setValidador(false, false)
          : setValidador(false, true);
    } else {
      if (sueldo.text.isEmpty) {
        setValidador(true, false);
      } else {
        setValidador(true, true);
        try {
          setValidador(true, true);
          calculoPrimaVacacional(context);
          diasVacaciones = calculoPrimaVacacional(context).toString();
          mostrarResultados(
              context,
              ResultadosPrimaVacacionalItems(
                  diasVacaciones: diasVacaciones,
                  cantidadPrimaRedondeado: primaVacacional == 'No aplica'
                      ? 'No aplica'
                      : '\$ $primaVacacional'));
        } catch (e) {
          showErrorMessage(context, true);
        }
      }
    }
  }

  List<String> periodosPago = ['Anual', 'Mensual', 'Semanal', 'Diario'];
  late String periodoActual = periodosPago[1];
  String diasVacaciones = '';
  String primaVacacional = '';
  double salarioConvertido = 0;

  int calculoPrimaVacacional(BuildContext context) {
    double conversion =
        convertirSueldo(sueldo, periodoActual, salarioConvertido);

    String dias = calcularTiempo(year, diasVacaciones);
    double totalPrimaVacacional = (conversion * int.parse(dias)) * 0.25;

    if (totalPrimaVacacional == 0) {
      setState(() {
        primaVacacional = 'No aplica';
      });
    } else {
      setState(() {
        primaVacacional = totalPrimaVacacional.toStringAsFixed(2);
      });
    }
    return int.parse(dias);
  }

  @override
  Widget build(BuildContext context) {
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
            Botones(
                limpiar: () {
                  setValidador(true, true);
                  showErrorMessage(context, false);
                  year.clear();
                  sueldo.clear();
                },
                numeroAMultiplicar: MediaQuery.of(context).size.height * 0.06,
                calcular: () => listo()),
          ],
        ),
      ),
    );
  }
}
