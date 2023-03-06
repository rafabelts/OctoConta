import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/informacion_gastos_otros.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/saluhigiene/informacion_gastos_saludhi.dart';
import 'package:provider/provider.dart';

class GastoSaludHigieneItems extends StatefulWidget {
  const GastoSaludHigieneItems({super.key});

  @override
  State<GastoSaludHigieneItems> createState() => _GastoSaludHigieneItemsState();
}

class _GastoSaludHigieneItemsState extends State<GastoSaludHigieneItems> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InformacionGastosSaludHigiene>(
      builder: (context, value, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: value.obtenerListaGastosSalud().length,
            itemBuilder: (context, index) {
              return ListTile(
                leading:
                    Text('${value.obtenerListaGastosSalud()[index].cantidad}X',
                        style: GoogleFonts.inter(
                          color: const Color(0xff4527A0),
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        )),
                title: Text(
                  value.obtenerListaGastosSalud()[index].articulo,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF2a195d),
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                trailing: Text(
                    '\$${NumberFormat('#,###.##').format(value.obtenerListaGastosSalud()[index].precio)}',
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
