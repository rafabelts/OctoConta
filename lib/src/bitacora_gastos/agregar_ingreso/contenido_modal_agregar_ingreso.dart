import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/bitacora_gastos/agregar_articulo/agregar_articulo.dart';

import '../../constants/colors.dart';
import '../../models/pagina_principal/bitacora_gastos/botones_categorias/botones_categorias.dart';
import '../../models/pagina_principal/bitacora_gastos/entradas_bitacora/botones_bitacora.dart';
import '../../models/pagina_principal/bitacora_gastos/entradas_bitacora/entradas_bitacora.dart';
import '../../models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';
import '../../models/pagina_principal/calculos_contables/periodos_pago.dart';
import 'agregar_ingreso.dart';

/* Creo el modal que permite a los usuarios agregar informacion
  sobre algun gasto realizado*/

class ContenidoModalAgregarIngreso extends StatefulWidget {
  const ContenidoModalAgregarIngreso({super.key});

  @override
  State<ContenidoModalAgregarIngreso> createState() =>
      _ContenidoModalAgregarIngresoState();
}

class _ContenidoModalAgregarIngresoState
    extends State<ContenidoModalAgregarIngreso> {
  TextEditingController ingreso = TextEditingController();
  TextEditingController monto = TextEditingController();

  @override
  void dispose() {
    ingreso.dispose();
    monto.dispose();
    super.dispose();
  }

  bool hayValorIngreso = true;

  void validarValorIngreso(bool valido) {
    setState(() {
      hayValorIngreso = valido;
    });
  }

  bool hayValorMonto = true;

  void validarValorMonto(bool valido) {
    setState(() {
      hayValorMonto = valido;
    });
  }

  @override
  Widget build(BuildContext context) {
    AgregarIngreso agregarIngreso = AgregarIngreso(
      contexto: context,
      ingreso: ingreso,
      monto: monto,
      validarIngreso: validarValorIngreso,
      validarMonto: validarValorMonto,
    );
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nombre del ingreso:",
            textAlign: TextAlign.justify,
            style: GoogleFonts.inter(
              color: secundario,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
            ),
          ),
          EntradaBitacora(
            controlador: ingreso,
            onChanged: (value) => agregarIngreso.onChanged(),
            onComplete: agregarIngreso.onCompleteIngreso,
            hayValor: hayValorIngreso,
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Text(
              "Monto del ingreso: (\$ MXN)",
              textAlign: TextAlign.justify,
              style: GoogleFonts.inter(
                color: secundario,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ),
            ),
          ),
          EntradaCalculos(
            controlador: monto,
            onChanged: (value) => agregarIngreso.onChanged(),
            onComplete: agregarIngreso.onCompleteMonto,
            hayValor: hayValorMonto,
          ),
          Padding(
            padding: EdgeInsets.only(top: 80.h, bottom: 50.h),
            child: BotonesBitacora(
              agregar: agregarIngreso.agregarArticulo,
              cancelar: agregarIngreso.cancelar,
            ),
          ),
        ],
      ),
    );
  }
}
