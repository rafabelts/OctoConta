import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgregarIngresoInputs extends StatelessWidget {
  const AgregarIngresoInputs({super.key});

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
              style: GoogleFonts.inter(
                color: const Color(0xFF534677),
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
              cursorColor: const Color(0xFF382A62),
              decoration: InputDecoration(
                  errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2.0)),
                  focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2.0)),
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
          keyboardType: TextInputType.number,
          style: GoogleFonts.inter(
            color: const Color(0xFF534677),
            fontWeight: FontWeight.w600,
            fontSize: 35,
          ),
          textAlign: TextAlign.center,
          cursorColor: const Color(0xFF382A62),
          decoration: InputDecoration(
              errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2.0)),
              focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2.0)),
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
