import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/screen_seleccionada/selected_screen.dart';

void navegarPantalla(BuildContext context, int indexClicked) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SelectedScreen(indexClicked: indexClicked)));
}

List<dynamic> listaCalculos = [
  ['Pago de una tarjeta de crédito', 0],
  ['Pago de un préstamo', 1],
  ['Honorarios', 2],
  ['Prima vacacional', 3],
  ['Impuesto Sobre Renta (ISR)', 4],
  ['Impuesto al Valor Agregado (IVA)', 5],
];

class ItemsCalculosContables extends StatelessWidget {
  const ItemsCalculosContables({super.key});

  @override
  Widget build(BuildContext context) {
    final decoracion = BoxDecoration(
      borderRadius: BorderRadius.circular(14.0),
      gradient: const LinearGradient(
        begin: Alignment(-0.300, -0.400),
        end: Alignment(-1.108, 1.800),
        colors: <Color>[
          Color(0xff2a195d),
          Color.fromARGB(211, 111, 96, 150)
        ], //2a195d  //2a1861
        stops: <double>[0, 1.0],
      ),
    );
    return SizedBox(
      height: 150,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 0.9),
        itemCount: listaCalculos.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
              decoration: decoracion,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 8.0,
                  shadowColor: Color(0xff2a195d),
                ),
                onPressed: () =>
                    navegarPantalla(context, listaCalculos[index][1]),
                child: Text(
                  listaCalculos[index][0],
                  style: GoogleFonts.inter(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
              ));
        },
      ),
    );
  }
}

// GridView.builder(
//             itemCount: listaCalculos.length,
//             scrollDirection: Axis.horizontal,
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 mainAxisSpacing: 20,
//                 childAspectRatio: 1 / 2),
//             itemBuilder: (BuildContext context, index) {
//               return ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF5E35B1),
//                     // side: const BorderSide(
//                     //     color: Color(0xFF5E35B1), width: 2.0),
//                     elevation: 8.0,
//                     shadowColor: Color(0xff2a195d),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(14.0))),
//                 onPressed: () =>
//                     navegarPantalla(context, listaCalculos[index][1]),
//                 child: Text(
//                   listaCalculos[index][0],
//                   style: GoogleFonts.inter(
//                     // color: const Color(0xFF5E35B1),
//                     color: Theme.of(context).scaffoldBackgroundColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               );
//             })

// ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF5E35B1),
//                     // side: const BorderSide(
//                     //     color: Color(0xFF5E35B1), width: 2.0),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(14.0))),
//                 onPressed: () =>
//                     navegarPantalla(context, listaCalculos[index][1]),
//                 child: Text(
//                   listaCalculos[index][0],
//                   style: GoogleFonts.inter(
//                     // color: const Color(0xFF5E35B1),
//                     color: Theme.of(context).scaffoldBackgroundColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               );

// Icon icono = const Icon(
//       Icons.arrow_forward_ios,
//       color: Color(0xFF5E35B1),
//       size: 16,
//     );
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: ListTile(
//             onTap: () => navegarPantalla(context, 0),
//             trailing: icono,
//             title: Text(
//               'Pago de una tarjeta de credito',
//               style: GoogleFonts.inter(
//                 color: const Color(0xFF5E35B1),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//           ),
//         ),
//         ListTile(
//             onTap: () => navegarPantalla(context, 1),
//             trailing: icono,
//             title: Text(
//               'Pago de un prestamo',
//               style: GoogleFonts.inter(
//                 color: const Color(0xFF5E35B1),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             )),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: ListTile(
//             onTap: () => navegarPantalla(context, 2),
//             trailing: icono,
//             title: Text(
//               'Honorarios',
//               style: GoogleFonts.inter(
//                 color: const Color(0xFF5E35B1),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//           ),
//         ),
//         ListTile(
//             onTap: () => navegarPantalla(context, 3),
//             trailing: icono,
//             title: Text(
//               'Prima vacacional',
//               style: GoogleFonts.inter(
//                 color: const Color(0xFF5E35B1),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             )),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: ListTile(
//             onTap: () => navegarPantalla(context, 4),
//             trailing: icono,
//             title: Text(
//               'Impuesto Sobre Renta (ISR)',
//               style: GoogleFonts.inter(
//                 color: const Color(0xFF5E35B1),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: ListTile(
//             onTap: () => navegarPantalla(context, 5),
//             trailing: icono,
//             title: Text(
//               'Impuesto al Valor Agregado (IVA)',
//               style: GoogleFonts.inter(
//                 color: const Color(0xFF5E35B1),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
