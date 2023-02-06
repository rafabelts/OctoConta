import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculoTarjetaInput extends StatelessWidget {
  const CalculoTarjetaInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Deuda de tu tarjeta al corte del mes: (\$)",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
            cursorColor: Color(0xFF382A62),
            decoration: InputDecoration(
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
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
          padding: const EdgeInsets.only(top: 40.0),
          child: Text(
            "Tasa de interés anual: (%)",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
            cursorColor: Color(0xFF382A62),
            decoration: InputDecoration(
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                hintText: "0.0",
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
