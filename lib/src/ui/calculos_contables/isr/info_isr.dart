import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
  Aqui ingreso la informacion acerca del calculo del ISR.
*/

class InfoISR extends StatelessWidget {
  const InfoISR({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '¿Qué es el ISR?',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h),
          child: Text(
            'El Impuesto Sobre Renta (ISR) es una carga fiscal directa que se aplica a los ingresos que incrementan el patrimonio de un contribuyente. De acuerdo a la ley del ISR, el pago de este impuesto es obligatorio tanto para personas fisicas y morales.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0.h),
          child: Text(
            'Impuesto Sobre Renta (ISR) a favor:',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            'Cuando tiene un saldo a favor podrá solicitar las devoluciones que le correspondan. Esto ocurre cuando al efectuar el cálculo de sus impuestos, resulta que pagó más de lo que debía, por lo que puede solicitar ante el SAT que le sea devuelta la cantidad.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Impuesto Sobre Renta (ISR) a retener:',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Text(
            'Es la cantidad de dinero que debe ser retenido por una empresa o empleador de los pagos que realiza a sus empleados o contratistas, y que posteriormente debe ser entregado a la autoridad fiscal correspondiente.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Text(
            'Sueldo Bruto:',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            'Es la cantidad total de dinero a favor del trabajador que una empresa debe pagar como contraprestación por sus servicios profesionales.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
