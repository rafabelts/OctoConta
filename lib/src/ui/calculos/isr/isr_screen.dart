import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/calcular_retencion.dart';
import 'package:octoconta_final/src/models/calcular_subsidio.dart';

import 'package:octoconta_final/src/models/dropdown_salario.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/isr/isr_inputs.dart';
import 'package:octoconta_final/src/ui/calculos/isr/isr_resultados_items.dart';

import '../../../models/error_calculando.dart';

class CalculoISRScreen extends StatefulWidget {
  const CalculoISRScreen({super.key});

  @override
  State<CalculoISRScreen> createState() => _CalculoISRScreenState();
}

class _CalculoISRScreenState extends State<CalculoISRScreen> {
  TextEditingController sueldo = TextEditingController();
  @override
  void initState() {
    super.initState();
    sueldo;
  }

  @override
  void dispose() {
    super.dispose();
    sueldo.dispose();
  }

  bool esNumero = true;
  setValidador(valid) {
    setState(() {
      esNumero = valid;
    });
  }

  onChanged() {
    if (sueldo.text.isEmpty) {
      setValidador(false);
    } else {
      setValidador(true);
    }
  }

  onSubmitted() {
    if (sueldo.text.isEmpty) {
      setValidador(false);
    } else {
      setValidador(true);
      FocusScope.of(context).unfocus();
    }
  }

  listo() {
    FocusScope.of(context).unfocus();
    if (sueldo.text.isEmpty) {
      setValidador(false);
    } else {
      setValidador(true);
      try {
        FocusScope.of(context).unfocus();
        setValidador(true);
        calculoDeIsr();
        mostrarResultados(
            context,
            ResultadosPrimaVacacionalItems(
                periodo: periodoActual == 'Mensual'
                    ? 'mensual $favorORetener'
                    : periodoActual == 'Quincenal'
                        ? 'quincenal $favorORetener'
                        : 'diario $favorORetener',
                isrRedondeado: isrUsuario,
                subsidioRedondeado: subsidio));
      } catch (e) {
        showErrorMessage(context, true);
      }
    }
  }

  List<String> periodosPago = ['Mensual', 'Quincenal', 'Diario'];
  late String periodoActual = periodosPago[1];

  late String subsidio;
  late String isrUsuario;
  late String favorORetener;
  double salarioConvertido = 0;

  calculoDeIsr() {
    double sueldoUsuario = double.parse(sueldo.text.replaceAll(',', ''));
    double subsidioUsuario = 0;
    double isr = 0;

    List<double> calcularIsrPeriodoSalario() {
      if (periodoActual == 'Mensual') {
        subsidioUsuario = calculoSubsidioMensual(sueldoUsuario);
        isr = calculoRetencionMensual(sueldoUsuario, subsidioUsuario);
        return [subsidioUsuario, isr];
      } else if (periodoActual == 'Quincenal') {
        subsidioUsuario = calculoSubsidioQuincenal(sueldoUsuario);
        isr = calculoRetencionQuincenal(sueldoUsuario, subsidioUsuario);
        return [subsidioUsuario, isr];
      } else {
        subsidioUsuario = calculoSubsidioDiario(sueldoUsuario);
        isr = calculoRetencionDiario(sueldoUsuario, subsidioUsuario);
        return [subsidioUsuario, isr];
      }
    }

    setState(() {
      subsidio = calcularIsrPeriodoSalario()[0].toStringAsFixed(2);
      if (calcularIsrPeriodoSalario()[1] <= 0) {
        isrUsuario = NumberFormat("#,###.##", "en_US")
            .format((calcularIsrPeriodoSalario()[1] * -1));
        favorORetener = 'a favor';
      } else {
        isrUsuario = NumberFormat("#,###.##", "en_US")
            .format(calcularIsrPeriodoSalario()[1]);
        favorORetener = 'a retener';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: <Widget>[
            CalculoIsrInput(
              sueldo: sueldo,
              onSubmitted: (value) => onSubmitted(),
              onChanged: (value) => onChanged(),
              esNumero: esNumero,
            ),
            DropdownPeriodoSalario(
              periodoActual: periodoActual,
              periodos: periodosPago,
              cambiarPeriodo: (String? diferentePeriodo) {
                setState(() {
                  periodoActual = diferentePeriodo!;
                });
              },
            ),
            Botones(
              limpiar: () {
                sueldo.clear();
                setValidador(true);
              },
              calcular: () => listo(),
              numeroAMultiplicar: MediaQuery.of(context).size.height * 0.24,
            ),
          ],
        ),
      ),
    );
  }
}
