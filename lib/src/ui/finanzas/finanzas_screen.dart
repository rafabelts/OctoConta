import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/constants/colors.dart';
import 'package:octoconta_final/src/ui/finanzas/gastos_e_ingresos.dart';

class PantallaFinanzas extends StatelessWidget {
  const PantallaFinanzas({super.key});

  @override
  Widget build(BuildContext context) {
    const actividad = {
      'Pizza': {
        'tipo': 'gasto',
        'fecha': '12/12/2021',
        'monto': 200,
      },
      'Paracetamol': {
        'tipo': 'gasto',
        'fecha': '12/12/2021',
        'monto': 200,
      },
      'Spotify': {
        'tipo': 'gasto',
        'fecha': '12/12/2021',
        'monto': 150,
      },
      'Quincena': {
        'tipo': 'ingreso',
        'fecha': '12/12/2021',
        'monto': 150,
      }
    };

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     'Mis finanzas:',
            //     style: Theme.of(context).textTheme.displayMedium,
            //   ),
            // ),
            Container(
              color: Colors.red,
              height: 350.h,
              width: double.infinity,
            ),
            SizedBox(height: 40.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Tu actividad:',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            Divider(
              color: primario,
              thickness: 0.5,
            ),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(
                  color: botonSecundarioColor,
                  thickness: 0.1,
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              itemCount: actividad.length < 10 ? actividad.length : 10,
              itemBuilder: (context, index) {
                final llave = actividad.keys.elementAt(index);
                return ListTile(
                  title: Text(llave),
                  leading: Icon(
                    actividad[llave]!['tipo'] == 'gasto'
                        ? Icons.minimize
                        : Icons.add,
                  ),
                  subtitle: Text(actividad[llave]!['fecha'].toString()),
                  trailing: Text('\$${actividad[llave]!['monto']}'),
                );
              },
            ),
            Divider(
              color: botonSecundarioColor,
              thickness: 0.1,
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GastosEIngresos())),
                child: Text(
                  'Ver más',
                  style: TextStyle(
                    color: botonPrimarioColor,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
