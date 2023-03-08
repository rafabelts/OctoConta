import 'package:flutter/material.dart';
import 'package:octoconta_final/src/services/base_datos_ingresos.dart';

class InformacionSaldoUsuario extends ChangeNotifier {
  double _saldoUsuario = 0.0;
  double get saldoDUsuario => _saldoUsuario;

  final db = BaseDatosDeIngresos();

  void agregarSaldo<SaldoItem>(double saldo) {
    _saldoUsuario = saldo;
    notifyListeners();
    db.guardarSaldo(saldo);
  }

  double prepararSaldoUsuario() {
    return db.leerSaldo();
  }
}
