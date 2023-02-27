import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CategoriasYCantidades extends StatelessWidget {
  const CategoriasYCantidades({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> categoriaYgasto = [
      ['Alimentos:', '100000', Colors.red],
      ['Salud e Higiene:', '0', Colors.red],
      ['Servicios:', '0', Colors.red],
      ['Suscripciones:', '0', Colors.red],
      ['Otros:', '0', Colors.red],
      ['Ingresos:', '0', Colors.green]
    ];
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0xff4527A0),
                offset: Offset(2.4, 5.5),
                blurRadius: 8,
                spreadRadius: 0,
              )
            ]),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            ListView.builder(
              itemCount: categoriaYgasto.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ListTile(
                    title: Text(
                      categoriaYgasto[index][0],
                      style: GoogleFonts.inter(
                          color: const Color(0xFF4527A0), //0xFF454568
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    trailing: Text(
                      '\$${NumberFormat("#,###.##", "en_US").format(double.tryParse(categoriaYgasto[index][1]))}',
                      style: GoogleFonts.inter(
                          color: categoriaYgasto[index][2], //0xFF454568
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
// NumberFormat("#,###.0#", "en_US").format

