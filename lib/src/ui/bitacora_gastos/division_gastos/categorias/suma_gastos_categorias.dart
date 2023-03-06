import 'package:flutter/material.dart';

class SumaTotalGastos extends ChangeNotifier {
  double obtenerGastoTotal(
      double providerGastoAlimento,
      double providerGastoSalud,
      double providerGastoServicios,
      double providerGastoSuscripciones,
      double providerGastoOtros) {
    double totalGastos = 0.0;

    double gastoAlimentos = providerGastoAlimento;

    double gastoSalud = providerGastoSalud;

    double gastoServicios = providerGastoServicios;

    double gastoSuscripciones = providerGastoSuscripciones;

    double gastoOtros = providerGastoOtros;

    totalGastos = gastoAlimentos +
        gastoSalud +
        gastoServicios +
        gastoSuscripciones +
        gastoOtros;

    return totalGastos == 0 ? 0 : totalGastos;
  }
}
