import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/calcular_isr.dart';
import 'package:octoconta_final/src/models/calcular_subsidio.dart';
import 'package:octoconta_final/src/models/conversion_sueldo.dart';
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
    showErrorMessage(context, false);
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
        calculoDeIsr(context);
        mostrarResultados(
            context,
            ResultadosPrimaVacacionalItems(
                isrRedondeado: isr, subsidioRedondeado: subsidio));
      } catch (e) {
        showErrorMessage(context, true);
      }
    }
  }

  List<String> periodosPago = ['Anual', 'Mensual', 'Semanal', 'Diario'];
  late String periodoActual = periodosPago[1];

  late String subsidio;
  late String isr;
  double salarioConvertido = 0;

  calculoDeIsr(BuildContext context) {
    double sueldoUsuario = double.parse(sueldo.text);
    double conversion =
        convertirSueldo(sueldo, periodoActual, salarioConvertido);
    double subsidioUsuario = calculoSubsidio(sueldoUsuario);
    double calculoDelIsr = calculoIsr(conversion, subsidioUsuario);
    setState(() {
      subsidio = subsidioUsuario.toStringAsFixed(2);
      isr = calculoDelIsr.toStringAsFixed(2);
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
              esNumero: true,
            ),
            DropdownPeriodoSalario(
                periodoActual: periodoActual, periodos: periodosPago),
            Botones(
              limpiar: () {},
              calcular: () => listo(),
              numeroAMultiplicar: MediaQuery.of(context).size.height * 0.24,
            ),
          ],
        ),
      ),
    );
  }
}
