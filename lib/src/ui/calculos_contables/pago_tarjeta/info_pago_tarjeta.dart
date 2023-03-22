import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
  Aqui ingreso la informacion acerca del calculo del interes de
  una tarjeta de credito.
*/

class InfoPagoTarjeta extends StatelessWidget {
  const InfoPagoTarjeta({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Tarjetas de crédito:',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            'Con las tarjetas de crédito, se pueden realizar pagos u retiros de dinero, hasta el límite de crédito fijado por la entidad financiera o banco, sin necesidad de tener en ese momento fondos en la cuenta bancaria.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.justify,
          ),
        ),
        Text(
          'Cuando la entidad financiera te proporciona una tarjeta de crédito, también te asigna una fecha de corte y una fecha de pago; de esta forma, mes a mes la entidad financiera hace las cuentas de lo que has gastado de tu cupo y a cuantas cuotas lo has diferido.',
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
