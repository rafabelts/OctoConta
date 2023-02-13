import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/saldo_mensual/edicionSaldo/edicion_saldo_inputs.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/saldo_mensual/edicionSaldo/edicion_saldo_botones.dart';

class EdicionSaldoYVerAhorro extends StatelessWidget {
  const EdicionSaldoYVerAhorro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(5.0),
        child: AdaptiveColumn(children: <AdaptiveContainer>[
          AdaptiveContainer(
            columnSpan: 12,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  EdicionSaldoInputs(),
                  BotonesEdicionSaldo(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
