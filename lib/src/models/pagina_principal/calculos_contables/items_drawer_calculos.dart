import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

/* 
  Creo los elementos que se encuentran dentro del menu Drawer
*/

List calculosContables = <String>[
  'Pago de una tarjeta de crédito',
  'Pago de un préstamo',
  'Honorarios',
  'Prima Vacacional',
  'Impuesto Sobre Renta (ISR)',
  'Impuesto al Valor Agregado (IVA)'
];

class DrawerCalculosItems extends StatelessWidget {
  final int indexScreen;
  final Function(int) cambioPantalla;
  const DrawerCalculosItems(
      {required this.indexScreen, required this.cambioPantalla, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 15.h, left: 25.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Calcular:',
                style: GoogleFonts.poppins(
                    color: const Color(0xff2E2B52),
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: calculosContables.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: ListTile(
                      onTap: () => cambioPantalla(index),
                      splashColor: const Color.fromARGB(32, 115, 79, 223),
                      tileColor: indexScreen == index
                          ? const Color.fromARGB(19, 115, 79, 223)
                          : Colors.transparent,
                      title: Text(
                        calculosContables[index],
                        style: GoogleFonts.poppins(
                          color: const Color(0xff4527A0), //382872 //453a88
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 70.h),
                  child: TextButton(
                    child: Text(
                      'Regresar',
                      style: GoogleFonts.inter(
                        color: entradaUsuarioColor, //382872 //453a88
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
