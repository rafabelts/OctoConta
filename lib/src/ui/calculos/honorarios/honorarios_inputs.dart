import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculoHonorariosInput extends StatelessWidget {
  final TextEditingController importe;
  final Function(dynamic) onChanged;
  final bool esNumero;
  final Function(dynamic) onSubmitted;
  const CalculoHonorariosInput(
      {required this.importe,
      required this.onChanged,
      required this.esNumero,
      required this.onSubmitted,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Importe: (\$)",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            controller: importe,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorText: esNumero ? null : 'Por favor ingrese un número',
                errorStyle: GoogleFonts.inter(
                    fontSize: 14, fontWeight: FontWeight.w600),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.red)),
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
      ],
    );
  }
}
