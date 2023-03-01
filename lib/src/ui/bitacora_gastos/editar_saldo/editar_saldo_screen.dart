import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/bitacora_botones.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/editar_saldo/editar_saldo_inputs.dart';

class EditarBalanceScreen extends StatefulWidget {
  const EditarBalanceScreen({super.key});

  @override
  State<EditarBalanceScreen> createState() => _EditarBalanceScreenState();
}

class _EditarBalanceScreenState extends State<EditarBalanceScreen> {
  TextEditingController saldo = TextEditingController();

  String mensajeDeErrorSaldo = '';
  bool errorInSaldo = false;
  mensajeErrorSaldo(String mensajeError, bool error) {
    setState(() {
      errorInSaldo = error;
      errorInSaldo == false ? false : (mensajeDeErrorSaldo = mensajeError);
    });
  }

  void editarSaldo() {
    if (saldo.text.isEmpty) {
      mensajeErrorSaldo('Por favor, ingrese su nuevo saldo.', true);
    } else {
      mensajeErrorSaldo('', false);
    }
  }

  onChangedSaldo() => mensajeErrorSaldo('', false);

  @override
  void initState() {
    super.initState();
    saldo;
  }

  @override
  void dispose() {
    super.dispose();
    saldo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saldo',
          style: GoogleFonts.inter(
              color: const Color(0xFF2a195d),
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
      body: AdaptiveColumn(
        children: <AdaptiveContainer>[
          AdaptiveContainer(
              columnSpan: 12,
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: EditarBalanceInputs(
                          saldo: saldo,
                          onChangedSaldo: (value) => onChangedSaldo(),
                          errorInSaldo: errorInSaldo == false
                              ? null
                              : mensajeDeErrorSaldo,
                        ),
                      ),
                      BotonesBitacora(
                        agregar: 'Editar',
                        cancelar: 'Cancelar',
                        agregarOpcion: () => editarSaldo(),
                        cancelarOpcion: () => Navigator.pop(context),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
