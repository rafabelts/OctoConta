import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/screen_seleccionada/selected_screen.dart';

void navegarPantalla(BuildContext context, int indexClicked) {
  Navigator.pop(context);
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SelectedScreen(indexClicked: indexClicked)));
}

class ItemsCalculosContables extends StatelessWidget {
  const ItemsCalculosContables({super.key});

  @override
  Widget build(BuildContext context) {
    Icon icono = const Icon(
      Icons.arrow_forward_ios,
      color: Color(0xFF5E35B1),
      size: 16,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            onTap: () => navegarPantalla(context, 0),
            trailing: icono,
            title: Text(
              'Pago de una tarjeta de credito',
              style: GoogleFonts.inter(
                color: const Color(0xFF5E35B1),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),
        ListTile(
            onTap: () => navegarPantalla(context, 1),
            trailing: icono,
            title: Text(
              'Pago de un prestamo',
              style: GoogleFonts.inter(
                color: const Color(0xFF5E35B1),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            onTap: () => navegarPantalla(context, 2),
            trailing: icono,
            title: Text(
              'Honorarios',
              style: GoogleFonts.inter(
                color: const Color(0xFF5E35B1),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),
        ListTile(
            onTap: () => navegarPantalla(context, 3),
            trailing: icono,
            title: Text(
              'Prima vacacional',
              style: GoogleFonts.inter(
                color: const Color(0xFF5E35B1),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            onTap: () => navegarPantalla(context, 4),
            trailing: icono,
            title: Text(
              'Impuesto Sobre Renta (ISR)',
              style: GoogleFonts.inter(
                color: const Color(0xFF5E35B1),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            onTap: () => navegarPantalla(context, 5),
            trailing: icono,
            title: Text(
              'Impuesto al Valor Agregado (IVA)',
              style: GoogleFonts.inter(
                color: const Color(0xFF5E35B1),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
