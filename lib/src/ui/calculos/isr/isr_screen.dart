import 'package:flutter/material.dart';

class CalculoISRScreen extends StatelessWidget {
  const CalculoISRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Calculo de ISR',
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}
