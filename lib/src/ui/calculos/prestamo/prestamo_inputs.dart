import 'package:flutter/material.dart';

class CalculoPrestamoInput extends StatelessWidget {
  const CalculoPrestamoInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Monto requerido: (\$)",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                hintText: "0.0",
                hintStyle: Theme.of(context).textTheme.labelLarge,
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF382A62))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.0, color: Color(0xFF382A62)))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Text(
            "Tasa de interés anual (%) del banco:",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                hintText: "0.0",
                hintStyle: Theme.of(context).textTheme.labelLarge,
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF382A62))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.0, color: Color(0xFF382A62)))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Text(
            "Cantidad de meses:",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                hintText: "0",
                hintStyle: Theme.of(context).textTheme.labelLarge,
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF382A62))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.0, color: Color(0xFF382A62)))),
          ),
        ),
      ],
    );
  }
}
