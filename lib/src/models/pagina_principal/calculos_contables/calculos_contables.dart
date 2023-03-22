import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import 'calculo_seleccionado.dart';

List<dynamic> listaCalculos = [
  ['Pago de una tarjeta de crédito', 0],
  ['Pago de un préstamo', 1],
  ['Honorarios', 2],
  ['Prima vacacional', 3],
  ['Impuesto Sobre Renta (ISR)', 4],
  ['Impuesto al Valor Agregado (IVA)', 5],
];

/* 
  Creacion del menu scrolleable de los calculos
  contables disponibles
*/

class CalculosContables extends StatelessWidget {
  const CalculosContables({super.key});

  @override
  Widget build(BuildContext context) {
    final decoracionTarjetaItem = BoxDecoration(
      borderRadius: BorderRadius.circular(14.0.r),
      gradient: LinearGradient(
        begin: Alignment(-0.300.w, -0.400.h),
        end: Alignment(-1.108.w, 1.800.h),
        colors: <Color>[
          primario,
          const Color.fromARGB(211, 111, 96, 150)
        ], //2a195d  //2a1861
        stops: const <double>[0, 1],
      ),
    );
    return SizedBox(
      width: 375.w,
      height: MediaQuery.of(context).size.height <= 640 ? 180.h : 150.h,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 0.87.w),
        itemCount: listaCalculos.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: decoracionTarjetaItem,
            margin: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, elevation: 0),
              onPressed: () {
                // Se hace la navegacion hacia la pantalla del calculo seleccionado
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculoSeleccionadoScreen(
                      calculoSeleccionado: listaCalculos[index][1],
                    ),
                  ),
                );
              },
              child: Text(
                listaCalculos[index][0],
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
