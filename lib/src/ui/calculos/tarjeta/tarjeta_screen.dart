import 'package:flutter/material.dart';
import 'package:octoconta_final/src/ui/calculos/tarjeta/tarjeta_inputs.dart';

class CalculoTarjetaScreen extends StatelessWidget {
  const CalculoTarjetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[CalculoTarjetaInput()],
      ),
    );
  }
}
