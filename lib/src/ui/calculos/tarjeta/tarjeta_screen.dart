import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_calculos.dart';
import 'package:octoconta_final/src/models/muestra_resultados.dart';
import 'package:octoconta_final/src/ui/calculos/tarjeta/tarjeta_inputs.dart';

class CalculoTarjetaScreen extends StatefulWidget {
  const CalculoTarjetaScreen({super.key});

  @override
  State<CalculoTarjetaScreen> createState() => _CalculoTarjetaScreenState();
}

class _CalculoTarjetaScreenState extends State<CalculoTarjetaScreen> {
  TextEditingController deuda = TextEditingController();
  TextEditingController interes = TextEditingController();

  @override
  void initState() {
    super.initState();
    deuda;
    interes;
  }

  @override
  void dispose() {
    super.dispose();
    deuda.dispose();
    interes.dispose();
  }

  bool esNumeroDeuda = true;
  bool esNumeroInteres = true;

  setValidador(valid, valid1) {
    setState(() {
      esNumeroDeuda = valid;
    });
  }

  onChanged() {
    if (deuda.text.isEmpty) {
      esNumeroDeuda = false;
    } else {
      esNumeroDeuda = true;
    }
  }

  onComplete() {
    if (deuda.text.isEmpty) {
      esNumeroDeuda = false;
    } else {
      esNumeroDeuda = true;
      FocusScope.of(context).nextFocus();
    }
  }

  onSubmitted() {
    FocusScope.of(context).unfocus();
    if (interes.text.isEmpty) {
      esNumeroInteres = false;
    } else {
      esNumeroInteres = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: <Widget>[
            ResultadosTarjetaItems(),
            Botones(
              limpiar: () {},
              calcular: () => mostrarResultados(
                  context,
                  Column(
                    children: [],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
