import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/informacion_ingreso.dart';
import 'package:provider/provider.dart';

class ItemsIngreso extends StatelessWidget {
  final List<dynamic> items;
  const ItemsIngreso({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InformacionIngresos>(
      builder: (context, value, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: value.obtenerListaIngresos().length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: ListTile(
                  splashColor: const Color.fromARGB(32, 115, 79, 223),
                  title: Text(
                    value.obtenerListaIngresos()[index].ingreso,
                    style: GoogleFonts.inter(
                      color: const Color(0xFF2a195d),
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  trailing: Text(
                    '\$${value.obtenerListaIngresos()[index].monto}',
                    style: GoogleFonts.inter(
                      color: const Color(0xff4527A0),
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
