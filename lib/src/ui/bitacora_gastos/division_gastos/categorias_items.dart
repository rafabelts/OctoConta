import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/alimentos_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/otros_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/saluhigiene/saludhigiene_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/servicios/servicios_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suscripciones/suscripciones_screen.dart';
import 'package:provider/provider.dart';

List<dynamic> categorias = [
  ['Alimentos', const AlimentosScreen()],
  ['Salud e Higiene', const GastosSaludeHigieneScreen()],
  ['Servicios', const GastosServiciosScreen()],
  ['Suscripciones', const GastosSuscripcionesScreen()],
  ['Otros', const GastosOtrosScreen()],
];

class CategoriasItems extends StatelessWidget {
  const CategoriasItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: categorias.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: ListTile(
            splashColor: const Color.fromARGB(32, 115, 79, 223),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => categorias[index][1])),
            title: Text(
              categorias[index][0],
              style: GoogleFonts.inter(
                color: const Color(0xFF2a195d),
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            trailing:
                const Icon(Icons.arrow_forward_ios, color: Color(0xff4527A0)),
          ),
        );
      },
    );
  }
}
