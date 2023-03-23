/* 
  Realizamos el calculo del IVA, se pasan como argumentos, 
  el context de la pantalla de donde se llamara para poder mostrar 
  el alert dialog
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../models/pagina_principal/alert_dialogs.dart';
import '../models/pagina_principal/modal_bottom.dart';

class CalculoIVA {
  final TextEditingController precio;
  final BuildContext contexto;
  final Function(bool) validarNumeroPrecio;
  void onChanged() {
    if (precio.text.isNotEmpty) {
      validarNumeroPrecio(true);
    }
  }

  void agregarIVA() {
    Navigator.pop(contexto);

    double? precioArticulo = double.tryParse(precio.text.replaceAll(',', ''));
    double cantidadIVA = precioArticulo! * 0.16;
    double precioFinal = precioArticulo + cantidadIVA;

    showDialog(
      context: contexto,
      builder: (context) => OctoAlertDialogs(
        contenidoDelDialog: Column(
          children: <Widget>[
            Text(
              'La cantidad de IVA que se agregará al artículo es de:',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0.h),
              child: Text(
                "\$${NumberFormat("#,##0.00").format(cantidadIVA)} MXN",
                style: GoogleFonts.inter(
                  color: botonSecundarioColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.sp,
                ),
              ),
            ),
            Text(
              "Lo que da un total de:",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0.h),
              child: Text(
                "\$${NumberFormat("#,##0.00").format(precioFinal)} MXN",
                style: GoogleFonts.inter(
                  color: botonSecundarioColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void restarIVA() {
    Navigator.pop(contexto);

    double? precioArticulo = double.tryParse(precio.text.replaceAll(',', ''));
    double precioFinal = precioArticulo! / (1 + .16);
    double cantidadIVA = precioArticulo - precioFinal;

    showDialog(
      context: contexto,
      builder: (context) => OctoAlertDialogs(
        contenidoDelDialog: Column(
          children: <Widget>[
            Text(
              'La cantidad de IVA que se restará al artículo es de:',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0.h),
              child: Text(
                '\$${NumberFormat("#,##0.00").format(cantidadIVA)} MXN',
                style: GoogleFonts.inter(
                  color: botonSecundarioColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.sp,
                ),
              ),
            ),
            Text(
              "Lo que da un total de:",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0.h),
              child: Text(
                '\$${NumberFormat("#,##0.00").format(precioFinal)} MXN',
                style: GoogleFonts.inter(
                  color: botonSecundarioColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget opcionesIVA(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 20.h, bottom: 20.h, left: 15.w, right: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 150.h,
            width: 150.w,
            child: TextButton(
              onPressed: restarIVA,
              child: Text(
                'Quitar IVA',
                style: GoogleFonts.inter(
                  color: botonSecundarioColor,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 150.h,
            width: 150.w,
            child: ElevatedButton(
              onPressed: agregarIVA,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r)),
                backgroundColor: botonPrimarioColor,
                padding:
                    EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 12.0.w),
              ),
              child: Text(
                'Agregar IVA',
                style: GoogleFonts.inter(
                  color: fondoColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void mostrarModal() {
    if (precio.text.isEmpty) {
      validarNumeroPrecio(false);
    } else {
      validarNumeroPrecio(true);
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
      showModalBottomSheet(
        context: contexto,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0.r),
                topRight: Radius.circular(40.0.r))),
        backgroundColor: fondoColor,
        builder: (contexto) => OctoModal(
          contenidoDelModal: opcionesIVA(contexto),
        ),
      );
    }
  }

  // void restaIVA() {
  //   Navigator.pop(contexto);
  //   double? precioArticulo = double.tryParse(precio.text.replaceAll(',', ''));

  // }

  void limpiar() {
    validarNumeroPrecio(true);
    precio.clear();
  }

  CalculoIVA({
    required this.validarNumeroPrecio,
    required this.contexto,
    required this.precio,
  });
}
