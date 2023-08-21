import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/constants/colors.dart';

/*
  Aqui ingreso la informacion acerca del calculo de la prima
  vacacional.
*/

class InfoPrimaVacacional extends StatelessWidget {
  const InfoPrimaVacacional({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Prima Vacacional:',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Text(
            'La prima vacacional es el dinero adicional que los patrones conceden a los empleados como suplemento para los días de descanso que se tomen en el año. Esto respaldado por el artículo 80 de la Ley Laboral de México.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            'Artículo 80:',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
        ),
        Text(
          'Los trabajadores tendrán derecho a una prima no menor de veinticinco por ciento sobre los salarios que les correspondan durante el período de vacaciones.',
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.justify,
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Text(
            'Sueldo Neto:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Text(
            'Es la cantidad de dinero que el empleado recibe todos los meses en la cuenta bancaria y que es el resultado de, justamente, hacer todas las retenciones y deducciones necesarias.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.justify,
          ),
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
