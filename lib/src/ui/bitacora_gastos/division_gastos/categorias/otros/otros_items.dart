import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/informacion_gastos_otros.dart';
import 'package:provider/provider.dart';

class GastosOtrosItems extends StatefulWidget {
  const GastosOtrosItems({super.key});

  @override
  State<GastosOtrosItems> createState() => _GastosOtrosItemsState();
}

class _GastosOtrosItemsState extends State<GastosOtrosItems> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InformacionGastosOtros>(
      builder: (context, value, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: value.obtenerListaGastosOtros().length,
            itemBuilder: (context, index) {
              return ListTile(
                leading:
                    Text('${value.obtenerListaGastosOtros()[index].cantidad}X',
                        style: GoogleFonts.inter(
                          color: const Color(0xff4527A0),
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        )),
                title: Text(
                  value.obtenerListaGastosOtros()[index].articulo,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF2a195d),
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                trailing: Text(
                    '\$${NumberFormat('#,###.##').format(value.obtenerListaGastosOtros()[index].precio)}',
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
