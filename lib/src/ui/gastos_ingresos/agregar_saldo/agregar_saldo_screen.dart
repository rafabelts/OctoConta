import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/pagina_principal/bitacora_gastos/entradas_bitacora/botones_bitacora.dart';
import 'package:octoconta_final/src/models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';

import '../../../bitacora_gastos/agregar_saldo.dart';
import '../../../constants/colors.dart';

class AgregarSaldoScreen extends StatefulWidget {
  const AgregarSaldoScreen({super.key});

  @override
  State<AgregarSaldoScreen> createState() => _AgregarSaldoScreenState();
}

class _AgregarSaldoScreenState extends State<AgregarSaldoScreen> {
  TextEditingController saldo = TextEditingController();
  @override
  void dispose() {
    saldo.dispose();
    super.dispose();
  }

  bool hayNumeroSaldo = true;

  void validarSaldo(bool valido) {
    setState(() {
      hayNumeroSaldo = valido;
    });
  }

  @override
  Widget build(BuildContext context) {
    AgregarSaldo agregar = AgregarSaldo(
      contexto: context,
      saldo: saldo,
      validarSaldo: validarSaldo,
    );
    return Padding(
      padding: EdgeInsets.only(
        top: 100.h,
        bottom: 30.h,
        right: 20.w,
        left: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Agregar Saldo (\$ MXN)',
            style: GoogleFonts.inter(
              color: secundario,
              fontWeight: FontWeight.w600,
              fontSize: 30.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h, bottom: 70.h),
            child: EntradaCalculos(
              controlador: saldo,
              onComplete: agregar.onComplete,
              onChanged: (value) => agregar.onChanged(),
              hayValor: hayNumeroSaldo,
            ),
          ),
          BotonesBitacora(
            agregar: agregar.agregarSaldo,
            cancelar: agregar.cancelar,
          ),
        ],
      ),
    );
  }
}
