import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/modal_selecciones.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/iva/iva_inputs.dart';

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
    precio;
  }

  late String precioArticulo = precio.text;
  String cantidadIvaPrecio = "0";
  String totalIVA = "0";
  String opcion = "";

  void calculoIVA() {
    setState(() {
      double? precio = double.tryParse(precioArticulo);
      if (opcion == 'agregar') {
        double cantidad = precio! * 0.16;
        double total = precio + cantidad;

        cantidadIvaPrecio = cantidad.toStringAsFixed(2);
        totalIVA = total.toStringAsFixed(2);
      }
    });
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
              precioArticulo: precio,
            ),
            Botones(
              limpiar: () {},
              calcular: () =>
                  modalBottomSeleciones(context, _buildAgregarQuitar(context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgregarQuitar(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Row(
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: Text("Restar IVA",
                    style: GoogleFonts.inter(
                      color: const Color(0xFF5E35B1),
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  opcion = "agregar";
                  calculoIVA();
                  mostrarResultados(
                      context,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("La cantidad de IVA del artículo es de:"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Align(
                              child: Text("\$$cantidadIvaPrecio"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text("Lo que da un total de:"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Align(
                              child: Text("\$$totalIVA"),
                            ),
                          ),
                        ],
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
