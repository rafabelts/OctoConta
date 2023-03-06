import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

class AgregarIngresoInputs extends StatelessWidget {
  final TextEditingController ingreso;
  final Function(dynamic) onChangedIngreso;
  final dynamic errorInIngreso;
  final VoidCallback onSubmittedIngreso;

  final TextEditingController montoIngreso;
  final Function(dynamic) onChangedMontoIngreso;
  final dynamic errorInMontoIngreso;
  final VoidCallback onSubmittedMontoIngreso;

  const AgregarIngresoInputs({
    required this.ingreso,
    required this.onChangedIngreso,
    required this.errorInIngreso,
    required this.onSubmittedIngreso,
    required this.montoIngreso,
    required this.onChangedMontoIngreso,
    required this.errorInMontoIngreso,
    required this.onSubmittedMontoIngreso,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Nombre del ingreso:",
          style: GoogleFonts.inter(
            color: const Color(0xff382A62),
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextField(
              controller: ingreso,
              onChanged: onChangedIngreso,
              onEditingComplete: onSubmittedIngreso,
              style: GoogleFonts.inter(
                color: const Color(0xFF534677),
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
              cursorColor: const Color(0xFF382A62),
              decoration: InputDecoration(
                  errorText: errorInIngreso,
                  errorStyle: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0)),
                  focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.red)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                  hintText: "Ingreso",
                  hintStyle: GoogleFonts.inter(
                    color: const Color(0xFF534677),
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF382A62))),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.0, color: Color(0xFF382A62)))),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Text(
            "Cantidad del ingreso: (\$)",
            style: GoogleFonts.inter(
              color: const Color(0xff382A62),
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
        ),
        TextField(
          controller: montoIngreso,
          onChanged: onChangedMontoIngreso,
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
          style: GoogleFonts.inter(
            color: const Color(0xFF534677),
            fontWeight: FontWeight.w600,
            fontSize: 35,
          ),
          textAlign: TextAlign.center,
          cursorColor: const Color(0xFF382A62),
          onEditingComplete: onSubmittedMontoIngreso,
          decoration: InputDecoration(
              errorText: errorInMontoIngreso,
              errorStyle:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
              errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0)),
              focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.red)),
              contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
              hintText: "0.0",
              hintStyle: GoogleFonts.inter(
                color: const Color(0xFF534677),
                fontWeight: FontWeight.w600,
                fontSize: 35,
              ),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF382A62))),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: Color(0xFF382A62)),
              )),
        ),
      ],
    );
  }
}
