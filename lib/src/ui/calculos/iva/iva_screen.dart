import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/agregar_iva.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/modal_selecciones.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/iva/iva_inputs.dart';
import 'package:octoconta_final/src/ui/calculos/iva/iva_resultados_items.dart';

import '../../../models/error_calculando.dart';

class CalculoIVAScreen extends StatefulWidget {
  const CalculoIVAScreen({super.key});

  @override
  State<CalculoIVAScreen> createState() => _CalculoIVAScreenState();
}

class _CalculoIVAScreenState extends State<CalculoIVAScreen> {
  TextEditingController precio = TextEditingController();

  @override
  void initState() {
    super.initState();
    precio;
  }

  @override
  void dispose() {
    super.dispose();
    precio.dispose();
  }

  bool esNumero = true;
  setValidador(valid) {
    setState(() {
      esNumero = valid;
    });
  }

  onChanged() {
    showErrorMessage(context, false);
    if (precio.text.isEmpty) {
      setValidador(false);
    } else {
      setValidador(true);
    }
  }

  listo() {
    FocusScope.of(context).unfocus();
    if (precio.text.isEmpty) {
      setValidador(false);
    } else {
      setValidador(true);
      if (precio.text == ',' || precio.text == '.' || precio.text == '-') {
        showErrorMessage(context, true);
      } else {
        modalBottomSeleciones(context, buildAgregarQuitar(context));
      }
    }
  }

  restarIVA() {
    Navigator.pop(context);
    calculoIVA(context, 'restar');
    cantidadIVARedondeado = calculoIVA(context, 'restar')[0].toStringAsFixed(2);
    precioFinalRedondeado = calculoIVA(context, 'restar')[1].toStringAsFixed(2);
    mostrarResultados(
        context,
        ResultadosIVAItems(
            cantidadIVAText:
                'La cantidad de IVA que se restara al articulo es de:',
            cantidadIVARedondeado: cantidadIVARedondeado,
            total: precioFinalRedondeado));
  }

  sumarIVA() {
    Navigator.pop(context);
    cantidadIVARedondeado =
        calculoIVA(context, "agregar")[0].toStringAsFixed(2);
    precioFinalRedondeado =
        calculoIVA(context, "agregar")[1].toStringAsFixed(2);

    mostrarResultados(
        context,
        ResultadosIVAItems(
          cantidadIVAText:
              'La cantidad de IVA que se agregara al articulo es de:',
          cantidadIVARedondeado: cantidadIVARedondeado,
          total: precioFinalRedondeado,
        ));
  }

  String cantidadIVARedondeado = '';
  String precioFinalRedondeado = '';

  List<dynamic> calculoIVA(BuildContext context, String opcion) {
    if (opcion == 'agregar') {
      double precioUsuario = double.parse(precio.text);
      double cantidadIVA = agregarIva(precioUsuario)[0];
      double total = agregarIva(precioUsuario)[1];
      return [cantidadIVA, total];
    } else {
      double precioUsuario = double.parse(precio.text);
      double precioFinal = precioUsuario / (1 + .16);
      double cantidadIVA = precioUsuario - precioFinal;
      return [cantidadIVA, precioFinal];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150.0),
        child: Column(
          children: <Widget>[
            CalculoIvaInput(
              onChanged: (value) => onChanged(),
              onSubmitted: (value) => listo(),
              precioArticulo: precio,
              esNumero: esNumero,
            ),
            Botones(
              limpiar: () {
                setValidador(true);
                precio.clear();
                FocusScope.of(context).unfocus();
              },
              calcular: () => listo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAgregarQuitar(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Restar IVA
              TextButton(
                onPressed: () => restarIVA(),
                child: Text(
                  '''Restar
IVA''',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF5E35B1),
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Agregar IVA
              ElevatedButton(
                onPressed: () => sumarIVA(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: const Color(0xFF5E35B1),
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 12.0),
                ),
                child: Text(
                  '''Agregar
IVA''',
                  style: GoogleFonts.inter(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
