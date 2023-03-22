import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../calculos/calculo_prestamo.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/botones_calculos.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';

/* 
  Creo la pantalla del calculo de interes de un prestamo bancario, 
  en este se encuentra el titulo y las entradas de texto para la 
  realizacion de los calculos.
*/

class CalculoInteresPrestamoScreen extends StatefulWidget {
  const CalculoInteresPrestamoScreen({super.key});

  @override
  State<CalculoInteresPrestamoScreen> createState() =>
      _CalculoInteresPrestamoScreenState();
}

class _CalculoInteresPrestamoScreenState
    extends State<CalculoInteresPrestamoScreen> {
  TextEditingController monto = TextEditingController();
  TextEditingController interes = TextEditingController();
  TextEditingController meses = TextEditingController();

  @override
  void dispose() {
    monto.dispose();
    interes.dispose();
    meses.dispose();
    super.dispose();
  }

  bool hayNumeroMonto = true;
  bool hayNumeroInteres = true;
  bool hayNumeroMeses = true;

  void validarNumeroMonto(bool valido) {
    setState(() {
      hayNumeroMonto = valido;
    });
  }

  void validarNumeroInteres(bool valido) {
    setState(() {
      hayNumeroInteres = valido;
    });
  }

  void validarNumeroMeses(bool valido) {
    setState(() {
      hayNumeroMeses = valido;
    });
  }

  @override
  Widget build(BuildContext context) {
    CalculoInteresPrestamo calculo = CalculoInteresPrestamo(
      validarNumeroMonto: validarNumeroMonto,
      validarNumeroInteres: validarNumeroInteres,
      validarNumeroMeses: validarNumeroMeses,
      contexto: context,
      monto: monto,
      interes: interes,
      meses: meses,
    );
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Monto requerido: (\$ MXN)',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.justify,
          ),
          EntradaCalculos(
            controlador: monto,
            onChanged: (value) => calculo.onChanged(),
            hayValor: hayNumeroMonto,
            onComplete: calculo.onSubmittedMonto,
          ),
          Padding(
            padding: EdgeInsets.only(top: 75.h),
            child: Text(
              'Tasa de interés anual (%) del banco:',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.justify,
            ),
          ),
          EntradaCalculos(
            controlador: interes,
            onComplete: calculo.onCompleteInteres,
            onChanged: (value) => calculo.onChanged(),
            hayValor: hayNumeroInteres,
          ),
          Padding(
            padding: EdgeInsets.only(top: 75.h),
            child: Text(
              'Cantidad de meses:',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.justify,
            ),
          ),
          EntradaCalculos(
            controlador: meses,
            onComplete: calculo.onCompleteMeses,
            onChanged: (value) => calculo.onChanged(),
            hayValor: hayNumeroMeses,
          ),
          BotonesCalculos(
            limpiar: calculo.limpiar,
            calcular: calculo.mostrarResultado,
            altoRegresar: 100.h,
          )
        ],
      ),
    );
  }
}
