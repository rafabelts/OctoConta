import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownCantidad extends StatefulWidget {
  final int cantidadUsuario;
  final List<int> cantidades;
  final Function(int?) cantidad;
  const DropdownCantidad(
      {required this.cantidadUsuario,
      required this.cantidades,
      required this.cantidad,
      super.key});

  @override
  State<DropdownCantidad> createState() => _DropdownCantidadState();
}

class _DropdownCantidadState extends State<DropdownCantidad> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff382A62), width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff382A62), width: 1.0),
        ),
      ),

      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 18,
        color: Color(0xff534677),
      ),
      //
      items: widget.cantidades.map((int? cantidades) {
        return DropdownMenuItem(
          value: cantidades,
          child: Text(
            "${cantidades!}",
            style: GoogleFonts.inter(
                color: const Color(0xff534677),
                fontWeight: FontWeight.bold,
                fontSize: 24),
            // fontWeight: FontWeight.w600,
          ),
        );
      }).toList(),
      value: widget.cantidadUsuario,
      onChanged: widget.cantidad,
    );
  }
}
