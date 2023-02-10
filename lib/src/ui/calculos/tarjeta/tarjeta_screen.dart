import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/tarjeta/tarjeta_inputs.dart';
import 'package:octoconta_final/src/ui/calculos/tarjeta/tarjeta_resultados_items.dart';

import '../../../models/error_calculando.dart';

class CalculoTarjetaScreen extends StatefulWidget {
  const CalculoTarjetaScreen({super.key});

  @override
  State<CalculoTarjetaScreen> createState() => _CalculoTarjetaScreenState();
}

class _CalculoTarjetaScreenState extends State<CalculoTarjetaScreen> {
  TextEditingController deuda = TextEditingController();
  TextEditingController interes = TextEditingController();

  @override
  void initState() {
    super.initState();
    deuda;
    interes;
  }

  @override
  void dispose() {
    super.dispose();
    deuda.dispose();
    interes.dispose();
  }

  bool esNumeroDeuda = true;
  bool esNumeroInteres = true;

  setValidador(valid, valid1) {
    setState(() {
      esNumeroDeuda = valid;
      esNumeroInteres = valid1;
    });
  }

  onChanged() {
    showErrorMessage(context, false);
    if (deuda.text.isEmpty) {
      interes.text.isEmpty
          ? setValidador(false, false)
          : setValidador(false, true);
    } else {
      interes.text.isEmpty
          ? setValidador(true, false)
          : setValidador(true, true);
    }
  }

  onComplete() {
    if (deuda.text.isEmpty) {
      interes.text.isEmpty
          ? setValidador(false, false)
          : setValidador(false, true);
    } else {
      if (interes.text.isEmpty) {
        setValidador(true, false);
        FocusScope.of(context).nextFocus();
      } else {
        setValidador(true, true);
        FocusScope.of(context).nextFocus();
      }
    }
  }

  listo() {
    FocusScope.of(context).unfocus();
    if (deuda.text.isEmpty) {
      interes.text.isEmpty
          ? setValidador(false, false)
          : setValidador(false, true);
    } else {
      if (interes.text.isEmpty) {
        setValidador(true, false);
      } else {
        setValidador(true, true);
        try {
          calcularInteres(context);
          mostrarResultados(
              context, ResultadosTarjetaItems(total: totalRedondeado));
        } catch (e) {
          showErrorMessage(context, true);
        }
      }
    }
  }

  late String totalRedondeado;
  calcularInteres(BuildContext context) {
    double deudaUsuario = double.parse(deuda.text);
    double saldosDiario = deudaUsuario / 30;

    double interesAnual = double.parse(interes.text);
    double interesMensual = (interesAnual / 100) / 12;

    double interesOrdinario = saldosDiario * interesMensual;
    double interesOrdinarioConIVA = interesOrdinario + (interesOrdinario * .16);
    setState(() {
      totalRedondeado = interesOrdinarioConIVA.toStringAsFixed(2);
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
            CalculoTarjetaInput(
              deuda: deuda,
              interes: interes,
              onChanged: (value) => onChanged(),
              esNumeroDeuda: esNumeroDeuda,
              esNumeroInteres: esNumeroInteres,
              onComplete: onComplete,
              onSubmitted: (value) => listo(),
            ),
            Botones(
                limpiar: () {
                  setValidador(true, true);
                  showErrorMessage(context, false);
                  deuda.clear();
                  interes.clear();
                },
                calcular: () => listo()),
          ],
        ),
      ),
    );
  }
}
