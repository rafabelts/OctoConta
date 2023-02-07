import 'package:flutter/material.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/boton_categorias.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/saldo_mensual/tarjeta.dart';

class BitacoraGastosScreen extends StatelessWidget {
  const BitacoraGastosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: const <Widget>[
            TarjetaSaldoMensual(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: BotonCategorias(),
            ),
          ],
        ),
      ),
    );
  }
}
