import 'package:flutter/material.dart';
import 'package:adaptive_components/adaptive_components.dart';

void modalBottomSeleciones(BuildContext context, Widget entradas) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10.0),
            child: AdaptiveColumn(
              children: <AdaptiveContainer>[
                AdaptiveContainer(
                  columnSpan: 12,
                  child: entradas,
                ),
              ],
            ),
          ));
}
