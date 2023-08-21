import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../calculos/calculo_prima_vacacional.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/botones_calculos.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';
import '../../../models/pagina_principal/calculos_contables/periodos_pago.dart';

/* 
  Creo la pantalla del calculo de la prima vacacional, en este
  se encuentra el titulo y las entradas de texto para la 
  realizacion de los calculos.
*/

class CalculoPrimaVacacionalScreen extends StatefulWidget {
  const CalculoPrimaVacacionalScreen({super.key});

  @override
  State<CalculoPrimaVacacionalScreen> createState() =>
      _CalculoPrimaVacacionalScreenState();
}

class _CalculoPrimaVacacionalScreenState
    extends State<CalculoPrimaVacacionalScreen> {
  final TextEditingController yearllegada = TextEditingController();
  final TextEditingController sueldo = TextEditingController();

  @override
  void dispose() {
    yearllegada.dispose();
    sueldo.dispose();
    super.dispose();
  }

  bool hayNumeroYear = true;
  void validarNumeroYear(bool valido) {
    setState(() {
      hayNumeroYear = valido;
    });
  }

  bool hayNumeroSueldo = true;
  void validarNumeroSueldo(bool valido) {
    setState(() {
      hayNumeroSueldo = valido;
    });
  }

  String periodoActual = 'Mensual';

  // Hago el cambio de periodo de pago
  void actualizarPeriodo(String? nuevoPeriodo) {
    setState(() {
      periodoActual = nuevoPeriodo!;
    });
  }

  @override
  Widget build(BuildContext context) {
    CalculoPrimaVacacional calculo = CalculoPrimaVacacional(
        contexto: context,
        yearLlegada: yearllegada,
        sueldo: sueldo,
        validarNumeroYear: validarNumeroYear,
        validarNumeroSueldo: validarNumeroSueldo,
        actualizarPeriodo: actualizarPeriodo,
        periodoActual: periodoActual);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Año de llegada a la empresa:',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.justify,
        ),
        EntradaCalculos(
          controlador: yearllegada,
          onChanged: (value) => calculo.onChanged(),
          onComplete: calculo.onCompleteYear,
          hayValor: hayNumeroYear,
        ),
        Padding(
          padding: EdgeInsets.only(top: 75.h),
          child: Text(
            'Sueldo neto:(\$ MXN)',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.justify,
          ),
        ),
        EntradaCalculos(
          controlador: sueldo,
          onChanged: (value) => calculo.onChanged(),
          onComplete: calculo.onCompleteSueldo,
          hayValor: hayNumeroSueldo,
        ),
        Padding(
          padding: EdgeInsets.only(top: 75.h),
          child: Text(
            "Período de pago:",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.justify,
          ),
        ),
        DropdownPeriodoSalario(
          periodos: calculo.periodosPago,
          cambiarPeriodo: actualizarPeriodo,
          periodoActual: periodoActual,
        ),
        BotonesCalculos(
          calcular: calculo.mostrarResultado,
          limpiar: calculo.limpiar,
        )
      ],
    );
  }
}
