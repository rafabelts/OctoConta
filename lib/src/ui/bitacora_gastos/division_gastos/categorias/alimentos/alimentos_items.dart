// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
// import 'package:provider/provider.dart';

// class GastosAlimentosItems extends StatelessWidget {
//   const GastosAlimentosItems({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<InformacionGastosAlimentos>(
//       builder: (context, value, child) {
//         return SizedBox(
//           height: MediaQuery.of(context).size.height * 0.5,
//           child: ListView.builder(
//             shrinkWrap: true,
//             physics: const BouncingScrollPhysics(),
//             itemCount: value.obtenerListaGastosAlimentos().length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 leading:
//                     Text('${value.obtenerListaGastosAlimentos()[index][0]}X',
//                         style: GoogleFonts.inter(
//                           color: const Color(0xff4527A0),
//                           fontWeight: FontWeight.w700,
//                           fontSize: 22,
//                         )),
//                 title: Text(
//                   value.obtenerListaGastosAlimentos()[index][1],
//                   style: GoogleFonts.inter(
//                     color: const Color(0xFF2a195d),
//                     fontWeight: FontWeight.w600,
//                     fontSize: 30,
//                   ),
//                 ),
//                 trailing:
//                     Text('\$${value.obtenerListaGastosAlimentos()[index][2]}',
//                         style: GoogleFonts.inter(
//                           color: const Color(0xff4527A0),
//                           fontWeight: FontWeight.w700,
//                           fontSize: 30,
//                         )),
//               );
//             },
//           ),
//           // child: ListView(
//           //   children: <Widget>[
//           //     ListTile(
//           //       title: Text(
//           //         'Comida 1',
//           //         style: GoogleFonts.inter(
//           //           color: const Color(0xFF2a195d),
//           //           fontWeight: FontWeight.w600,
//           //           fontSize: 30,
//           //         ),
//           //       ),
//           //       trailing: Text('\$ 0',
//           //           style: GoogleFonts.inter(
//           //             color: const Color(0xff4527A0),
//           //             fontWeight: FontWeight.w700,
//           //             fontSize: 30,
//           //           )),
//           //     )
//           //   ],
//           // ),
//         );
//       },
//     );
//   }
// }
