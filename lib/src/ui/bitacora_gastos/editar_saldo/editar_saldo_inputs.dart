import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

class EditarBalanceInputs extends StatelessWidget {
  final TextEditingController saldo;
  final Function(dynamic) onChangedSaldo;
  final dynamic errorInSaldo;
  final VoidCallback onSubmittedSaldo;

  const EditarBalanceInputs(
      {required this.saldo,
      required this.onChangedSaldo,
      required this.errorInSaldo,
      required this.onSubmittedSaldo,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Editar Saldo: (\$)',
            style: GoogleFonts.inter(
              color: const Color(0xff382A62),
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: TextField(
              controller: saldo,
              onChanged: onChangedSaldo,
              keyboardType: TextInputType.number,
              style: GoogleFonts.inter(
                color: const Color(0xFF534677),
                fontWeight: FontWeight.w600,
                fontSize: 48,
              ),
              onEditingComplete: onSubmittedSaldo,
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
              textAlign: TextAlign.center,
              cursorColor: const Color(0xFF382A62),
              decoration: InputDecoration(
                  errorText: errorInSaldo,
                  errorStyle: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0)),
                  focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.red)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                  hintText: "\$0",
                  hintStyle: GoogleFonts.inter(
                    color: const Color(0xFF534677),
                    fontWeight: FontWeight.w600,
                    fontSize: 48,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF382A62))),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.0, color: Color(0xFF382A62)))),
            ),
          )
        ]);
  }
}
