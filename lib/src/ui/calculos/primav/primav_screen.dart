import 'package:flutter/material.dart';

class CalculoPrimaVacacionalScreen extends StatelessWidget {
  const CalculoPrimaVacacionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Calculo de Prima Vacacional',
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}
