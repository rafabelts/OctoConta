import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/dropdown_cantidad.dart';

class BitacoraGastosInput extends StatelessWidget {
  const BitacoraGastosInput({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> cantidades = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    int cantidadReciente = cantidades[0];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Nombre del artículo:",
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
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                hintText: "Articulo",
                hintStyle: GoogleFonts.inter(
                  color: const Color(0xFF534677),
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
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
            "Cantidad y Precio del artículo:",
            style: GoogleFonts.inter(
              color: const Color(0xff382A62),
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width * 0.18,
                child: DropdownCantidad(
                    cantidadUsuario: cantidadReciente, cantidades: cantidades),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF534677),
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
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
                        fontSize: 28,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF382A62))),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.0, color: Color(0xFF382A62)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
