import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  List<String> periodosPago = ['Anual', 'Mensual', 'Semanal', 'Diario'];
  String diasVacaciones = '';
  String primaVacacional = '';
  late String periodoActual = periodosPago[1];

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
          calculoPrimaVacacional();
          print(periodoActual);
          diasVacaciones = calculoPrimaVacacional().toString();
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

  int calculoPrimaVacacional() {
    double conversion =
        convertirSueldo(sueldo.text.replaceAll(',', ''), periodoActual);
    print(conversion);
    String dias = calcularTiempo(year, diasVacaciones);
    double totalPrimaVacacional = (conversion * int.parse(dias)) * 0.25;

    if (totalPrimaVacacional == 0) {
      setState(() {
        primaVacacional = 'No aplica';
      });
    } else {
      setState(() {
        primaVacacional =
            NumberFormat("#,###.##", "en_US").format(totalPrimaVacacional);
      });
    }
    return int.parse(dias);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02),
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
              periodos: periodosPago,
              cambiarPeriodo: (String? diferentePeriodo) {
                setState(() {
                  periodoActual = diferentePeriodo!;
                });
              },
              periodoActual: periodoActual,
            ),
            Botones(
                limpiar: () {
                  setValidador(true, true);
                  year.clear();
                  sueldo.clear();
                },
                numeroAMultiplicar: MediaQuery.of(context).size.height * 0.1,
                calcular: () => listo()),
          ],
        ),
      ),
    );
  }
}
