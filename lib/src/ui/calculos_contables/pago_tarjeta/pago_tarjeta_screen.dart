import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../calculos/calculo_tarjeta.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/botones_calculos.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';

/* 
  Creo la pantalla del calculo de interes de la tarjeta de credito, 
  en este se encuentra el titulo y las entradas de texto para la 
  realizacion de los calculos.
*/

class CalculoInteresTarjetaScreen extends StatefulWidget {
  const CalculoInteresTarjetaScreen({super.key});

  @override
  State<CalculoInteresTarjetaScreen> createState() =>
      _CalculoInteresTarjetaScreenState();
}

class _CalculoInteresTarjetaScreenState
    extends State<CalculoInteresTarjetaScreen> {
  TextEditingController deuda = TextEditingController();
  TextEditingController interes = TextEditingController();

  @override
  void dispose() {
    deuda.dispose();
    interes.dispose();
    super.dispose();
  }

  bool hayNumeroDeuda = true;
  bool hayNumeroInteres = true;

  void validarNumeroDeuda(bool valido) {
    setState(() {
      hayNumeroDeuda = valido;
    });
  }

  void validarNumeroInteres(bool valido) {
    setState(() {
      hayNumeroInteres = valido;
    });
  }

  @override
  Widget build(BuildContext context) {
    CalculoInteresTarjeta calculo = CalculoInteresTarjeta(
      validarNumeroDeuda: validarNumeroDeuda,
      validarNumeroInteres: validarNumeroInteres,
      contexto: context,
      deuda: deuda,
      interes: interes,
    );
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Deuda de tu tarjeta al corte del mes: (\$ MXN)',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.justify,
          ),
          // Entrada texto de deuda
          EntradaCalculos(
            controlador: calculo.deuda,
            hayValor: hayNumeroDeuda,
            onChanged: (value) => calculo.onChanged(),
            onComplete: calculo.onCompleteDeuda,
          ),
          Padding(
            padding: EdgeInsets.only(top: 75.h),
            child: Text('Tasa de interés anual:(%)',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.justify),
          ),
          // Entrada texto de interes
          EntradaCalculos(
            controlador: calculo.interes,
            hayValor: hayNumeroInteres,
            onChanged: (value) => calculo.onChanged(),
            onComplete: calculo.onCompleteInteres,
          ),
          BotonesCalculos(
            limpiar: calculo.limpiar,
            calcular: calculo.mostrarResultado,
          )
        ],
      ),
    );
  }
}
