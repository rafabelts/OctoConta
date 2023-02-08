import 'dart:math';

import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/prestamo/prestamo_inputs.dart';
import 'package:octoconta_final/src/ui/calculos/prestamo/prestamo_resultados_items.dart';

import '../../../models/buttons_calculos.dart';

class CalculoPrestamoScreen extends StatefulWidget {
  const CalculoPrestamoScreen({super.key});

  @override
  State<CalculoPrestamoScreen> createState() => _CalculoPrestamoScreenState();
}

class _CalculoPrestamoScreenState extends State<CalculoPrestamoScreen> {
  TextEditingController monto = TextEditingController();
  TextEditingController interes = TextEditingController();
  TextEditingController meses = TextEditingController();

  @override
  void initState() {
    super.initState();
    monto;
    interes;
    meses;
  }

  @override
  void dispose() {
    super.dispose();
    monto.dispose();
    interes.dispose();
    meses.dispose();
  }

  bool esNumeroMonto = true;
  bool esNumeroInteres = true;
  bool esNumeroMeses = true;

  setValidador(valid, valid1, valid2) {
    setState(() {
      esNumeroMonto = valid;
      esNumeroInteres = valid1;
      esNumeroMeses = valid2;
    });
  }

  String totalRedondeado = '';

  @override
  Widget build(BuildContext context) {
    // Calculos prestamo
    late String montoUsuario = monto.text;
    late String interesUsuario = interes.text;
    late String mesesUsuario = meses.text;

    calculoPrestamo() {
      setState(() {
        // Realiza el calculo del prestamo
        double monto = double.parse(montoUsuario);

        double interesAnual = double.parse(interesUsuario);
        double interesMensual = (interesAnual / 100) / 12;

        int meses = -(int.parse(mesesUsuario));

        double pagoMensual =
            monto / ((1 - (pow((1 + interesMensual), meses))) / interesMensual);
        totalRedondeado = pagoMensual.toStringAsFixed(2);
      });
    }

    listo() {
      FocusScope.of(context).unfocus();
      if (monto.text.isEmpty) {
        setValidador(false, false, false);
      } else if (interes.text.isEmpty) {
        setValidador(true, true, false);
      } else if (meses.text.isEmpty) {
        setValidador(true, true, false);
      } else {
        setValidador(true, true, true);
        calculoPrestamo();
        mostrarResultados(
            context, ResultadosPrestamoItems(total: totalRedondeado));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: <Widget>[
            CalculoPrestamoInput(
              esNumeroInteres: esNumeroInteres,
              esNumeroMeses: esNumeroMeses,
              esNumeroMonto: esNumeroMonto,
              monto: monto,
              tasaInteres: interes,
              meses: meses,
              onChanged: (value) {
                if (monto.text.isEmpty) {
                  setValidador(false, false, false);
                } else if (interes.text.isEmpty) {
                  setValidador(true, true, false);
                } else if (meses.text.isEmpty) {
                  setValidador(true, true, false);
                } else {
                  setValidador(true, true, true);
                }
              },
              onCompleteMonto: () {
                if (monto.text.isEmpty) {
                  setValidador(false, true, false);
                } else {
                  setValidador(true, false, false);
                  FocusScope.of(context).nextFocus();
                }
              },
              onCompleteInteres: () {
                if (interes.text.isEmpty) {
                  setValidador(true, false, false);
                } else {
                  setValidador(true, true, false);
                  FocusScope.of(context).nextFocus();
                }
              },
              onSubmitted: (value) => listo(),
            ),
            Botones(
              limpiar: () {
                monto.clear();
                interes.clear();
                meses.clear();
              },
              calcular: listo,
            ),
          ],
        ),
      ),
    );
  }
}
