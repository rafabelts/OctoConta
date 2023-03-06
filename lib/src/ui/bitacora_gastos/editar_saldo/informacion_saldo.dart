import 'package:flutter/material.dart';

class InformacionSaldoUsuario extends ChangeNotifier {
  double _saldoUsuario = 0.0;
  double get saldoDUsuario => _saldoUsuario;

  void agregarSaldo<SaldoItem>(double saldo) {
    _saldoUsuario = saldo;
    notifyListeners();
  }
}
