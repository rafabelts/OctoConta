import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/dropdown_cantidad.dart';

class AgregarGastoInputs extends StatelessWidget {
  final TextEditingController articulo;
  final Function(dynamic) onChangedArticulo;
  final dynamic articuloError;

  final List<int> cantidades;
  final int cantidadReciente;

  final TextEditingController precio;
  final Function(dynamic) onChangedPrecio;
  final dynamic precioError;

  const AgregarGastoInputs(
      {required this.articulo,
      required this.onChangedArticulo,
      required this.articuloError,
      required this.cantidades,
      required this.cantidadReciente,
      required this.precio,
      required this.onChangedPrecio,
      required this.precioError,
      super.key});

  @override
  Widget build(BuildContext context) {
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
            controller: articulo,
            onChanged: onChangedArticulo,
            style: GoogleFonts.inter(
              color: const Color(0xFF534677),
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorText: articuloError,
                errorStyle: GoogleFonts.inter(
                    fontSize: 14, fontWeight: FontWeight.w600),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.red)),
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
                width: MediaQuery.of(context).size.width * 0.23,
                child: DropdownCantidad(
                    cantidadUsuario: cantidadReciente, cantidades: cantidades),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.56,
                child: TextField(
                  controller: precio,
                  onChanged: onChangedPrecio,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF534677),
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                  cursorColor: const Color(0xFF382A62),
                  decoration: InputDecoration(
                      errorText: precioError,
                      errorStyle: GoogleFonts.inter(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      errorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 2.0)),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.red)),
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
