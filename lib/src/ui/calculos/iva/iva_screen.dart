import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/modal_selecciones.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/iva/iva_inputs.dart';
import 'package:octoconta_final/src/ui/calculos/iva/iva_resultados_items.dart';

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

  listo() {
    FocusScope.of(context).unfocus();
    if (precio.text.isEmpty) {
      setValidador(false);
    } else {
      setValidador(true);
      modalBottomSeleciones(context, buildAgregarQuitar());
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
              onChanged: (value) {
                if (precio.text.isEmpty) {
                  setValidador(false);
                } else {
                  setValidador(true);
                }
              },
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
              calcular: () {
                FocusScope.of(context).unfocus();
                if (precio.text.isEmpty) {
                  setValidador(false);
                } else {
                  modalBottomSeleciones(context, buildAgregarQuitar());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAgregarQuitar() {
    late String precioArticulo = precio.text;
    String opcion = '';
    String cantidadIVARedondeado = '';
    String precioFinalRedondeado = '';

    calculoIVA() {
      if (opcion == 'agregar') {
        double? precio = double.tryParse(precioArticulo);

        double cantidadIVA = precio! * 0.16;
        cantidadIVARedondeado = cantidadIVA.toStringAsFixed(2);
        double precioFinal = precio + cantidadIVA;
        precioFinalRedondeado = precioFinal.toStringAsFixed(2);
      } else {
        double? precio = double.tryParse(precioArticulo);
        double precioFinal = precio! / (1 + .16);
        precioFinalRedondeado = precioFinal.toStringAsFixed(2);

        double cantidadIVA = precio - precioFinal;
        cantidadIVARedondeado = cantidadIVA.toStringAsFixed(2);
      }
    }

    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Row(
            children: <Widget>[
              // Restar IVA
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  calculoIVA();
                  print(cantidadIVARedondeado);
                  print(precioFinalRedondeado);

                  mostrarResultados(
                      context,
                      ResultadosIVAItems(
                        cantidadIVAText:
                            'La cantidad de IVA que se restara al articulo es de:',
                        cantidadIVARedondeado: cantidadIVARedondeado,
                        total: precioFinalRedondeado,
                      ));
                },
                child: Text("Restar IVA",
                    style: GoogleFonts.inter(
                      color: const Color(0xFF5E35B1),
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    )),
              ),

              // Agregar IVA
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  opcion = "agregar";
                  calculoIVA();
                  print(cantidadIVARedondeado);
                  print(precioFinalRedondeado);

                  mostrarResultados(
                      context,
                      ResultadosIVAItems(
                        cantidadIVAText:
                            'La cantidad de IVA que se agregara al articulo es de:',
                        cantidadIVARedondeado: cantidadIVARedondeado,
                        total: precioFinalRedondeado,
                      ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: const Color(0xFF5E35B1),
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 12.0),
                ),
                child: Text(
                  "Agregar IVA",
                  style: GoogleFonts.inter(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
