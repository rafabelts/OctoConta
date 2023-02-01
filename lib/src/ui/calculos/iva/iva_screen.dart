import 'package:flutter/material.dart';

class CalculoIVAScreen extends StatelessWidget {
  const CalculoIVAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Calculo de IVA',
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}
