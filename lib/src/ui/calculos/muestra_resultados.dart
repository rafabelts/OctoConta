import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';

void mostrarResultados(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => Center(
            child: AdaptiveColumn(
              children: <AdaptiveContainer>[
                AdaptiveContainer(
                  columnSpan: 4,
                  child: AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    content: const Text("Amarrillo"),
                  ),
                )
              ],
            ),
          ));
}
