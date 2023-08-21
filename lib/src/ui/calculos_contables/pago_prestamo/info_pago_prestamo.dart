import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/constants/colors.dart';

/*
  Aqui ingreso la informacion acerca del calculo del interes de un
  prestamo bancario.
*/

class InfoPagoPrestamo extends StatelessWidget {
  const InfoPagoPrestamo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '¿Qué es un prestamo?',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            'Un préstamo es la operación mediante la cual la entidad financiera pone a disposición del cliente una determinada cantidad de dinero, estipulada previamente, mediante un contrato con el que dicho cliente adquiere la obligación de devolver el dinero en un tiempo delimitado. De manera habitual, a la cantidad de dinero prestada por el banco se le añaden unos intereses que también hay que devolver, y que variarán en función del tipo de préstamo solicitado.',
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
