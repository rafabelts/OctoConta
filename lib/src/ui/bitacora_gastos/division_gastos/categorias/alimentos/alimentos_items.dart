import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import 'package:provider/provider.dart';

class GastosAlimentosItems extends StatefulWidget {
  const GastosAlimentosItems({super.key});

  @override
  State<GastosAlimentosItems> createState() => _GastosAlimentosItemsState();
}

class _GastosAlimentosItemsState extends State<GastosAlimentosItems> {
  @override
  void initState() {
    super.initState();
    // prepara datos
    Provider.of<InformacionGastosAlimentos>(context, listen: false)
        .prepararDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InformacionGastosAlimentos>(
      builder: (context, value, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: value.obtenerListaGastosAlimentos().length,
            itemBuilder: (context, index) {
              return Center(
                  child: ListTile(
                leading: Text(
                    '${value.obtenerListaGastosAlimentos()[index].cantidad}X',
                    style: GoogleFonts.inter(
                      color: const Color(0xff4527A0),
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    )),
                title: Text(
                  value.obtenerListaGastosAlimentos()[index].articulo,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF2a195d),
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                  ),
                ),
                trailing: Text(
                    '\$${NumberFormat('#,###.##').format(value.obtenerListaGastosAlimentos()[index].precio)}',
                    style: GoogleFonts.inter(
                      color: const Color(0xff4527A0),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    )),
              ));
            },
          ),
        );
      },
    );
  }
}
