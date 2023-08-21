import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../calculos/calculo_isr.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/botones_calculos.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';
import '../../../models/pagina_principal/calculos_contables/periodos_pago.dart';

/* 
  Creo la pantalla del calculo de ISR, se encuentra el titulo y 
  las entradas de texto para la realizacion de los calculos.
*/

class CalculoISRScreen extends StatefulWidget {
  const CalculoISRScreen({super.key});

  @override
  State<CalculoISRScreen> createState() => _CalculoISRScreenState();
}

class _CalculoISRScreenState extends State<CalculoISRScreen> {
  final TextEditingController sueldo = TextEditingController();

  @override
  void dispose() {
    sueldo.dispose();
    super.dispose();
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
    CalculoISR calculo = CalculoISR(
        validarNumeroSueldo: validarNumeroSueldo,
        contexto: context,
        sueldo: sueldo,
        actualizarPeriodo: actualizarPeriodo,
        periodoActual: periodoActual);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Sueldo bruto: (\$ MXN)",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.left,
        ),
        EntradaCalculos(
            controlador: sueldo,
            onChanged: (value) => calculo.onChanged(),
            onComplete: calculo.onComplete,
            hayValor: hayNumeroSueldo),
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
