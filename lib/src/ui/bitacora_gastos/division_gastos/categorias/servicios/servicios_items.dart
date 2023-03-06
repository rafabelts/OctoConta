import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/informacion_gastos_otros.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/saluhigiene/informacion_gastos_saludhi.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/servicios/informacion_gastos_servicios.dart';
import 'package:provider/provider.dart';

class GastoServiciosItems extends StatefulWidget {
  const GastoServiciosItems({super.key});

  @override
  State<GastoServiciosItems> createState() => _GastoServiciosItemsState();
}

class _GastoServiciosItemsState extends State<GastoServiciosItems> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InformacionGastosServicios>(
      builder: (context, value, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: value.obtenerListaGastosServicios().length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                    '${value.obtenerListaGastosServicios()[index].cantidad}X',
                    style: GoogleFonts.inter(
                      color: const Color(0xff4527A0),
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    )),
                title: Text(
                  value.obtenerListaGastosServicios()[index].articulo,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF2a195d),
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                trailing: Text(
                    '\$${NumberFormat('#,###.##').format(value.obtenerListaGastosServicios()[index].precio)}',
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
