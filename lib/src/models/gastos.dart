import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GastosItems extends StatelessWidget {
  final List<dynamic> compras;
  const GastosItems({required this.compras, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: compras.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              compras[index][0],
              style: GoogleFonts.inter(
                color: const Color(0xFF2a195d),
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            trailing: Text('\$${compras[index][1]}',
                style: GoogleFonts.inter(
                  color: const Color(0xff4527A0),
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                )),
          );
        },
      ),
      // child: ListView(
      //   children: <Widget>[
      //     ListTile(
      //       title: Text(
      //         'Comida 1',
      //         style: GoogleFonts.inter(
      //           color: const Color(0xFF2a195d),
      //           fontWeight: FontWeight.w600,
      //           fontSize: 30,
      //         ),
      //       ),
      //       trailing: Text('\$ 0',
      //           style: GoogleFonts.inter(
      //             color: const Color(0xff4527A0),
      //             fontWeight: FontWeight.w700,
      //             fontSize: 30,
      //           )),
      //     )
      //   ],
      // ),
    );
  }
}
