import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/constants/colors.dart';

/*
  Aqui ingreso la informacion acerca del calculo del IVA.
*/

class InfoIVA extends StatelessWidget {
  const InfoIVA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '¿Qué es el IVA?',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0.h),
          child: Text(
            'El Impuesto al Valor Agregado (IVA) es un tipo de impuesto aplicado al consumo de bienes y servicios en distintos países. Esta carga consiste en un porcentaje o tasa determinada por las instituciones tributarias que se agrega al costo final de aquellos productos o servicios que consumes.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            'Función:',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
        ),
        Text(
          'La función del cobro de este impuesto es para que el estado obtenga ingresos mediante cargas las actividades de venta de bienes, servicios, arrendamiento de bienes, así como también la importación de bienes y servicios.',
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.justify,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cerrar',
                style: TextStyle(color: botonPrimarioColor, fontSize: 18.sp),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        )
      ],
    );
  }
}
