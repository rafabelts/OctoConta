import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suscripciones/informacion_gastos_suscripciones.dart';
import 'package:provider/provider.dart';

class GastosSuscripcionesItems extends StatefulWidget {
  const GastosSuscripcionesItems({super.key});

  @override
  State<GastosSuscripcionesItems> createState() =>
      _GastosSuscripcionesItemsState();
}

class _GastosSuscripcionesItemsState extends State<GastosSuscripcionesItems> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InformacionGastosSuscripciones>(
      builder: (context, value, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: value.obtenerListaGastosSuscripciones().length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                    '${value.obtenerListaGastosSuscripciones()[index].cantidad}X',
                    style: GoogleFonts.inter(
                      color: const Color(0xff4527A0),
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    )),
                title: Text(
                  value.obtenerListaGastosSuscripciones()[index].articulo,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF2a195d),
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                trailing: Text(
                    '\$${NumberFormat('#,###.##').format(value.obtenerListaGastosSuscripciones()[index].precio)}',
                    style: GoogleFonts.inter(
                      color: const Color(0xff4527A0),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    )),
              );
            },
          ),
        );
      },
    );
  }
}
