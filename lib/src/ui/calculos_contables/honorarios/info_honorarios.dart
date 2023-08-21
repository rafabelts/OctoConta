import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/constants/colors.dart';

/*
  Aqui ingreso la informacion acerca del calculo de honorarios.
*/

class InfoHonorarios extends StatelessWidget {
  const InfoHonorarios({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Honorarios:',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            'Tipo de pago que se efectúa a alguien que realiza de manera autónoma una tarea o servicio para una empresa o persona. Se entiende que esta contraprestación económica que percibe un profesional por la prestación de servicios. Esto significa, que no se trata de un trabajador que se encuentra en nómina, es decir, que no existe una relación laboral contratada.',
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
