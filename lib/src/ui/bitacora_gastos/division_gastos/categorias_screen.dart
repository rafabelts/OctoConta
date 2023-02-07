import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/modal_selecciones.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/bitacora_botones.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/bitacora_inputs.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/items_categorias.dart';

class CategoriasGastosScreen extends StatelessWidget {
  const CategoriasGastosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categorías',
          style: GoogleFonts.inter(
              color: const Color(0xFF2a195d),
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () =>
              modalBottomSeleciones(context, _buildInputs(context)),
          backgroundColor: const Color(0xFF5E35B1),
          child: Icon(
            Icons.add,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 50,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(5.0),
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
              columnSpan: 12,
              child: Column(
                children: <Widget>[
                  const ItemsCategorias(),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        Text('Este mes ha gastado:',
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(
                                    232, 42, 25, 93), //0xFF2a195d
                                fontSize: 30,
                                fontWeight: FontWeight.w600)),
                        Text('\$0',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF2a195d), //0xFF2a195d
                                fontSize: 58,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputs(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Column(
            children: const <Widget>[
              BitacoraGastosInput(),
              BotonesBitacora(),
            ],
          ),
        ));
  }
}
