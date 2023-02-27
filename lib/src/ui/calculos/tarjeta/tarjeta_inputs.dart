import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

class CalculoTarjetaInput extends StatelessWidget {
  final TextEditingController deuda;
  final TextEditingController interes;
  final Function(dynamic) onChanged;
  final bool esNumeroDeuda;
  final bool esNumeroInteres;
  final VoidCallback onComplete;
  final Function(dynamic) onSubmitted;
  const CalculoTarjetaInput(
      {required this.deuda,
      required this.interes,
      required this.onChanged,
      required this.esNumeroDeuda,
      required this.esNumeroInteres,
      required this.onComplete,
      required this.onSubmitted,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Deuda de tu tarjeta al corte del mes: (\$)",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            controller: deuda,
            onChanged: onChanged,
            onEditingComplete: onComplete,
            keyboardType: TextInputType.number,
            inputFormatters: [
              NumberTextInputFormatter(
                integerDigits: 10,
                decimalDigits: 2,
                maxValue: '1000000000.00',
                decimalSeparator: '.',
                groupDigits: 3,
                groupSeparator: ',',
                allowNegative: false,
                overrideDecimalPoint: true,
                insertDecimalPoint: false,
                insertDecimalDigits: false,
              ),
            ],
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorText: esNumeroDeuda ? null : 'Por favor ingrese un número',
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
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Text(
            "Tasa de interés anual:(%)",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            controller: interes,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            inputFormatters: [
              NumberTextInputFormatter(
                integerDigits: 10,
                decimalDigits: 2,
                maxValue: '1000000000.00',
                decimalSeparator: '.',
                groupDigits: 3,
                groupSeparator: ',',
                allowNegative: false,
                overrideDecimalPoint: true,
                insertDecimalPoint: false,
                insertDecimalDigits: false,
              ),
            ],
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorText:
                    esNumeroInteres ? null : 'Por favor ingrese un número',
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
