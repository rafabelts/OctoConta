import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/agregar_iva.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/error_calculando.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/honorarios/honorarios_inputs.dart';
import 'package:octoconta_final/src/ui/calculos/honorarios/honorarios_resultados_items.dart';

class CalculoHonorariosScreen extends StatefulWidget {
  const CalculoHonorariosScreen({super.key});

  @override
  State<CalculoHonorariosScreen> createState() =>
      _CalculoHonorariosScreenState();
}

class _CalculoHonorariosScreenState extends State<CalculoHonorariosScreen> {
  TextEditingController importe = TextEditingController();

  @override
  void initState() {
    super.initState();
    importe;
  }

  @override
  void dispose() {
    super.dispose();
    importe.dispose();
  }

  bool esNumero = true;
  setValidador(valid) {
    setState(() {
      esNumero = valid;
    });
  }

  onChanged() {
    showErrorMessage(context, false);
    if (importe.text.isEmpty) {
      setValidador(false);
    } else {
      setValidador(true);
    }
  }

  listo() {
    if (importe.text.isEmpty) {
      setValidador(false);
    } else {
      setValidador(true);
      try {
        calculoDeHonorarios(context);
        mostrarResultados(
            context, ResultadoHonorariosItems(total: totalRedondeado));
      } catch (e) {
        showErrorMessage(context, true);
      }
    }
  }

  String totalRedondeado = '';
  calculoDeHonorarios(BuildContext context) {
    double importeUsuario = double.parse(importe.text);
    List<double> iva = agregarIva(
        importeUsuario); // importo la funcion para conseguir el valor del iva

    double ingresoConIva = importeUsuario + iva[0];

    double diesPorcientoImporte = importeUsuario * .10;

    double isrResico = (iva[0] / 3) * 2;

    double total = ingresoConIva - diesPorcientoImporte - isrResico;
    setState(() {
      totalRedondeado = total.toStringAsFixed(2);
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
            CalculoHonorariosInput(
              onChanged: (value) => onChanged(),
              importe: importe,
              esNumero: esNumero,
              onSubmitted: (value) => listo(),
            ),
            Botones(
              limpiar: () {
                FocusScope.of(context).unfocus();
                importe.clear();
              },
              calcular: () => listo(),
              numeroAMultiplicar: MediaQuery.of(context).size.height * 0.3,
            )
          ],
        ),
      ),
    );
  }
}
