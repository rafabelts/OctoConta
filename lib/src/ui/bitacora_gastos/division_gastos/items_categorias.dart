import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/alimentos_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/otros_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/saluhigiene/saludhigiene_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/servicios/servicios_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suscripciones/suscripciones_screen.dart';

class ItemsCategorias extends StatelessWidget {
  const ItemsCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: ListTile(
            splashColor: const Color.fromARGB(32, 115, 79, 223),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GastosAlimentosScreen())),
            title: Text(
              'Alimentos',
              style: GoogleFonts.inter(
                color: const Color(0xFF2a195d),
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            trailing:
                const Icon(Icons.arrow_forward_ios, color: Color(0xff4527A0)),
          ),
        ),
        ListTile(
          splashColor: const Color.fromARGB(32, 115, 79, 223),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const GastosSaludeHigieneScreen())),
          title: Text(
            'Salud e Higiene',
            style: GoogleFonts.inter(
              color: const Color(0xFF2a195d),
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          trailing:
              const Icon(Icons.arrow_forward_ios, color: Color(0xff4527A0)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: ListTile(
            splashColor: const Color.fromARGB(32, 115, 79, 223),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GastosServiciosScreen())),
            title: Text(
              'Servicios',
              style: GoogleFonts.inter(
                color: const Color(0xFF2a195d),
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            trailing:
                const Icon(Icons.arrow_forward_ios, color: Color(0xff4527A0)),
          ),
        ),
        ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const GastosSuscripcionesScreen())),
          splashColor: const Color.fromARGB(32, 115, 79, 223),
          title: Text(
            'Suscripciones',
            style: GoogleFonts.inter(
              color: const Color(0xFF2a195d),
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          trailing:
              const Icon(Icons.arrow_forward_ios, color: Color(0xff4527A0)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: ListTile(
            splashColor: const Color.fromARGB(32, 115, 79, 223),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GastosOtrosScreen())),
            title: Text(
              'Otros',
              style: GoogleFonts.inter(
                color: const Color(0xFF2a195d),
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            trailing:
                const Icon(Icons.arrow_forward_ios, color: Color(0xff4527A0)),
          ),
        ),
      ],
    );
  }
}
