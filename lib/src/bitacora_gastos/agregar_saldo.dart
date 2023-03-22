import 'package:flutter/material.dart';
import 'package:octoconta_final/src/services/informacion_bitacora.dart';
import 'package:provider/provider.dart';

import '../models/mensaje_scaffold.dart';

class AgregarSaldo {
  final BuildContext contexto;
  final TextEditingController saldo;
  final Function(bool) validarSaldo;

  onChanged() => validarSaldo(true);

  void onComplete() {
    if (saldo.text.isEmpty) {
      validarSaldo(false);
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
    }
  }

  void agregarSaldo() {
    if (saldo.text.isEmpty) {
      validarSaldo(false);
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
      double? saldoUsuario = double.tryParse(saldo.text.replaceAll(',', ''));
      Provider.of<InformacionBitacora>(contexto, listen: false)
          .agregarSaldo(saldoUsuario!);

      MensajeScaffold(
              contexto: contexto,
              mensaje:
                  'Saldo agregado, en caso de tener un gasto se le restará a su nuevo saldo y en caso de tener un ingreso se le sumará')
          .mostrar();

      Navigator.pop(contexto);
      Navigator.pop(contexto);

      print(Provider.of<InformacionBitacora>(contexto, listen: false)
          .prepararSaldo());
    }
  }

  void cancelar() {
    validarSaldo(false);
    saldo.clear();
    Navigator.pop(contexto);
  }

  AgregarSaldo({
    required this.contexto,
    required this.saldo,
    required this.validarSaldo,
  });
}
