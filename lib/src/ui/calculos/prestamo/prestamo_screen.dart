import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/prestamo/prestamo_inputs.dart';
import 'package:octoconta_final/src/ui/calculos/prestamo/prestamo_resultados_items.dart';

import '../../../models/buttons_calculos.dart';
import '../../../models/error_calculando.dart';

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

  onChanged() {
    if (monto.text.isEmpty) {
      if (interes.text.isEmpty) {
        meses.text.isEmpty
            ? setValidador(false, false, false)
            : setValidador(false, false, true);
      } else {
        meses.text.isEmpty
            ? setValidador(false, true, false)
            : setValidador(false, true, true);
      }
    } else {
      if (interes.text.isEmpty) {
        meses.text.isEmpty
            ? setValidador(true, false, false)
            : setValidador(true, false, true);
      } else {
        meses.text.isEmpty
            ? setValidador(true, true, false)
            : setValidador(true, true, true);
      }
    }
  }

  onCompleteMonto() {
    if (monto.text.isEmpty) {
      if (interes.text.isEmpty) {
        meses.text.isEmpty
            ? setValidador(false, false, false)
            : setValidador(false, false, true);
      } else {
        meses.text.isEmpty
            ? setValidador(false, true, false)
            : setValidador(false, true, true);
      }
    } else {
      if (interes.text.isEmpty) {
        if (meses.text.isEmpty) {
          setValidador(true, false, false);
          FocusScope.of(context).nextFocus();
        } else {
          setValidador(true, false, true);
          FocusScope.of(context).nextFocus();
        }
      } else {
        if (meses.text.isEmpty) {
          setValidador(true, true, false);
          FocusScope.of(context).nextFocus();
        } else {
          setValidador(true, true, true);
          FocusScope.of(context).nextFocus();
        }
      }
    }
  }

  onCompleteInteres() {
    if (interes.text.isEmpty) {
      if (monto.text.isEmpty) {
        meses.text.isEmpty
            ? setValidador(false, false, false)
            : setValidador(false, false, true);
      } else {
        meses.text.isEmpty
            ? setValidador(true, false, false)
            : setValidador(true, false, true);
      }
    } else {
      if (monto.text.isEmpty) {
        if (meses.text.isEmpty) {
          setValidador(false, true, false);
          FocusScope.of(context).nextFocus();
        } else {
          setValidador(true, true, true);
          FocusScope.of(context).nextFocus();
        }
      } else {
        if (meses.text.isEmpty) {
          setValidador(true, true, false);
          FocusScope.of(context).nextFocus();
        } else {
          setValidador(true, true, true);
          FocusScope.of(context).nextFocus();
        }
      }
    }
  }

  listo() {
    FocusScope.of(context).unfocus();
    if (interes.text.isEmpty) {
      if (monto.text.isEmpty) {
        meses.text.isEmpty
            ? setValidador(false, false, false)
            : setValidador(false, false, true);
      } else {
        meses.text.isEmpty
            ? setValidador(true, false, false)
            : setValidador(true, false, true);
      }
    } else {
      if (monto.text.isEmpty) {
        if (meses.text.isEmpty) {
          setValidador(false, true, false);
        } else {
          setValidador(true, true, true);
          try {
            calculoPrestamo();
            mostrarResultados(
                context, ResultadosPrestamoItems(total: totalRedondeado));
          } catch (e) {
            showErrorMessage(context, true);
          }
        }
      } else {
        if (meses.text.isEmpty) {
          setValidador(true, true, false);
        } else {
          setValidador(true, true, true);
          try {
            calculoPrestamo();
            mostrarResultados(
                context, ResultadosPrestamoItems(total: totalRedondeado));
          } catch (e) {
            showErrorMessage(context, true);
          }
        }
      }
    }
  }

  String totalRedondeado = '';
  calculoPrestamo() {
    // Realiza el calculo del prestamo
    double montoUsuario = double.parse(monto.text.replaceAll(',', ''));

    double interesAnual = double.parse(interes.text.replaceAll(',', ''));
    double interesMensual = (interesAnual / 100) / 12;

    int mesesUsuario = -(int.parse(meses.text.replaceAll(',', '')));

    double pagoMensual = montoUsuario /
        ((1 - (pow((1 + interesMensual), mesesUsuario))) / interesMensual);
    setState(() {
      totalRedondeado = NumberFormat("#,###.##", "en_US").format(pagoMensual);
    });
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
            CalculoPrestamoInput(
              esNumeroInteres: esNumeroInteres,
              esNumeroMeses: esNumeroMeses,
              esNumeroMonto: esNumeroMonto,
              monto: monto,
              tasaInteres: interes,
              meses: meses,
              onChanged: (value) => onChanged(),
              onCompleteMonto: onCompleteMonto,
              onCompleteInteres: onCompleteInteres,
              onSubmitted: (value) => listo(),
            ),
            Botones(
              limpiar: () {
                setValidador(true, true, true);
                monto.clear();
                interes.clear();
                meses.clear();
              },
              numeroAMultiplicar: MediaQuery.of(context).size.height * 0.06,
              calcular: listo,
            ),
          ],
        ),
      ),
    );
  }
}
