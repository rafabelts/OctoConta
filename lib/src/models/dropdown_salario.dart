import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownPeriodoSalario extends StatefulWidget {
  final String periodoActual;
  final List<String> periodos;
  final Function(String?) cambiarPeriodo;
  const DropdownPeriodoSalario(
      {required this.periodoActual,
      required this.periodos,
      required this.cambiarPeriodo,
      super.key});

  @override
  State<DropdownPeriodoSalario> createState() => _DropdownPeriodoSalarioState();
}

class _DropdownPeriodoSalarioState extends State<DropdownPeriodoSalario> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Período de pago:",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: DropdownButtonFormField(
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
                size: 35,
                color: Color(0xff534677),
              ),
              //
              items: widget.periodos.map((String? periodos) {
                return DropdownMenuItem(
                  value: periodos,
                  child: Text(
                    periodos!,
                    style: GoogleFonts.inter(
                        color: const Color(0xff534677),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    // fontWeight: FontWeight.w600,
                  ),
                );
              }).toList(),
              onChanged: widget.cambiarPeriodo,
              value: widget.periodoActual,
            ),
          )
        ],
      ),
    );
  }
}
