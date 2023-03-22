import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../calculos/calculo_honorarios.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/botones_calculos.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';

/* 
  Creo la pantalla del calculo de honorarios, se encuentra el titulo y 
  las entradas de texto para la realizacion de los calculos.
*/

class CalculoHonorariosScreen extends StatefulWidget {
  const CalculoHonorariosScreen({super.key});

  @override
  State<CalculoHonorariosScreen> createState() =>
      _CalculoHonorariosScreenState();
}

class _CalculoHonorariosScreenState extends State<CalculoHonorariosScreen> {
  TextEditingController importe = TextEditingController();

  @override
  void dispose() {
    importe.dispose();
    super.dispose();
  }

  bool hayNumeroImporte = true;

  void validarNumeroImporte(bool valido) {
    setState(() {
      hayNumeroImporte = valido;
    });
  }

  @override
  Widget build(BuildContext context) {
    CalculoHonorarios calculo = CalculoHonorarios(
      validarNumeroImporte: validarNumeroImporte,
      contexto: context,
      importe: importe,
    );
    return Padding(
      padding: EdgeInsets.only(top: 120.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Importe: (\$ MXN)',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.left,
          ),
          EntradaCalculos(
            controlador: importe,
            onComplete: calculo.mostrarResultado,
            onChanged: (value) => calculo.onChanged(),
            hayValor: hayNumeroImporte,
          ),
          BotonesCalculos(
            limpiar: calculo.limpiar,
            calcular: calculo.mostrarResultado,
            altoRegresar: 260.h,
          )
        ],
      ),
    );
  }
}
