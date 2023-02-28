import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/bitacora_botones.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/agregar_ingreso.dart';

class IngresosInputs extends StatelessWidget {
  const IngresosInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              const AgregarIngresoInputs(),
              BotonesBitacora(
                agregar: "Agregar",
                cancelar: "Cancelar",
                agregarOpcion: () {},
                cancelarOpcion: () {},
              ),
            ],
          ),
        ));
  }
}
