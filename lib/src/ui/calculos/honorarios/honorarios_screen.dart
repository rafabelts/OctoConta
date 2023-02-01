import 'package:flutter/material.dart';

class CalculoHonorariosScreen extends StatelessWidget {
  const CalculoHonorariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Calculo de Honorarios',
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}
