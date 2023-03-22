import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../services/informacion_bitacora.dart';

/*
  Con este container/caja se muestra la categoria y el total gastado en cada categoria.
*/

class MuestraDeCategoriaConCantidades extends StatelessWidget {
  const MuestraDeCategoriaConCantidades({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> totales = {
      'Alimentos': Provider.of<InformacionBitacora>(context, listen: true)
          .prepararTotalGastos()[1],
      'Salud': Provider.of<InformacionBitacora>(context, listen: true)
          .prepararTotalGastos()[2],
      'Servicios': Provider.of<InformacionBitacora>(context, listen: true)
          .prepararTotalGastos()[3],
      'Suscripciones': Provider.of<InformacionBitacora>(context, listen: true)
          .prepararTotalGastos()[4],
      'Otros': Provider.of<InformacionBitacora>(context, listen: true)
          .prepararTotalGastos()[5],
      'Ingresos': Provider.of<InformacionBitacora>(context, listen: true)
          .prepararTotalIngresos(),
    };
    List categoriasYCantidades = <dynamic>[
      ['Alimentos', totales['Alimentos'], colorError],
      ['Salud e Higiene', totales['Salud'], colorError],
      ['Servicios', totales['Servicios'], colorError],
      ['Suscripciones', totales['Suscripciones'], colorError],
      ['Otros', totales['Otros'], colorError],
      ['Ingresos', totales['Ingresos'], Colors.green],
    ];
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: botonSecundarioColor,
            offset: Offset(2.4.w, 5.5.h),
            blurRadius: 8,
            spreadRadius: 0,
          )
        ],
      ),
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: categoriasYCantidades.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ListTile(
                title: Text(
                  '${categoriasYCantidades[index][0]}:',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF4527A0), //0xFF454568
                    fontWeight: FontWeight.w600,
                    fontSize: 19.sp,
                  ),
                ),
                trailing: SizedBox(
                    width: 100.w,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                        '\$${NumberFormat("#,##0.00", "en_US").format(categoriasYCantidades[index][1])}',
                        style: GoogleFonts.inter(
                          color: categoriasYCantidades[index][2], //0xFF454568
                          fontWeight: FontWeight.w600,
                          fontSize: 19.sp,
                        ),
                      ),
                    ))),
          );
        },
      ),
    );
  }
}
