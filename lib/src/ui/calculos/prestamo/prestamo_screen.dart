import 'package:flutter/material.dart';

class CalculoPrestamoScreen extends StatelessWidget {
  const CalculoPrestamoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Calculo de Prestamo',
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}
