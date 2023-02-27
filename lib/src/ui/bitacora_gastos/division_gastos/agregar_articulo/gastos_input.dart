import 'package:flutter/material.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/bitacora_botones.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/agregar_articulo/agregar_gasto_input.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/agregar_articulo/categoria_eleccion.dart';

class GastosInputs extends StatelessWidget {
  const GastosInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.01),
          child: Column(
            children: const <Widget>[
              AgregarGastoInputs(),
              Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: CategoriasEleccion()),
              BotonesBitacora(),
            ],
          ),
        ));
  }
}
