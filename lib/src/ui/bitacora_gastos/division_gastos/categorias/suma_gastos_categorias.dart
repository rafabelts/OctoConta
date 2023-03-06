import 'package:flutter/material.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/informacion_gastos_otros.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/saluhigiene/informacion_gastos_saludhi.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/servicios/informacion_gastos_servicios.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suscripciones/informacion_gastos_suscripciones.dart';
import 'package:provider/provider.dart';

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
