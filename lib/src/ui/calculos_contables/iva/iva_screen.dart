import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../calculos/calculo_iva.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/botones_calculos.dart';
import '../../../models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';

/* 
  Creo la pantalla del calculo de IVA, se encuentra el titulo y 
  las entradas de texto para la realizacion de los calculos.
*/

class CalculoIVAScreen extends StatefulWidget {
  const CalculoIVAScreen({super.key});

  @override
  State<CalculoIVAScreen> createState() => _CalculoIVAScreenState();
}

class _CalculoIVAScreenState extends State<CalculoIVAScreen> {
  TextEditingController precio = TextEditingController();

  @override
  void dispose() {
    precio.dispose();
    super.dispose();
  }

  bool hayNumeroPrecio = true;

  void validarNumeroPrecio(bool valido) {
    setState(() {
      hayNumeroPrecio = valido;
    });
  }

  @override
  Widget build(BuildContext context) {
    CalculoIVA calculo = CalculoIVA(
      validarNumeroPrecio: validarNumeroPrecio,
      contexto: context,
      precio: precio,
    );

    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Precio del artículo: (\$ MXN)",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.left,
          ),
          EntradaCalculos(
            controlador: precio,
            onChanged: (value) => calculo.onChanged(),
            onComplete: calculo.mostrarModal,
            hayValor: hayNumeroPrecio,
          ),
          BotonesCalculos(
            calcular: calculo.mostrarModal,
            altoRegresar: 260.h,
          )
        ],
      ),
    );
  }
}
