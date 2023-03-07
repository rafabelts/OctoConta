import 'package:hive_flutter/hive_flutter.dart';

import '../models/ingreso_item.dart';

class BaseDatosDeIngresos {
  final _mybox = Hive.box("base_datos_ingresos");

  // Guardar ingreso
  void guardarIngresos(List<IngresoItem> ingresos) {
    List<List<dynamic>> ingresosFormateados = [];

    for (var ingreso in ingresos) {
      List<dynamic> ingresoFormateado = [
        ingreso.ingreso,
        ingreso.monto,
      ];
      ingresosFormateados.add(ingresoFormateado);
    }

    // Guardar en la base de datos
    _mybox.put('Ingresos_totales', ingresosFormateados);
  }

  // Guardar valor total de ingresos
  void totalDeIngresos(double obtenerTotal) {
    double totalIngresos = obtenerTotal;
    _mybox.put("Ingresos_total", totalIngresos);
  }

  // Leer total ingresps
  double leerTotalIngresos() {
    return _mybox.get("Ingresos_total", defaultValue: 0.0);
  }

  // Leer datos de ingresos
  List<IngresoItem> leerDatosIngresos() {
    List ingresosGuardados = _mybox.get('Ingresos_totales') ?? [];
    List<IngresoItem> ingresosTotal = [];

    for (int i = 0; i < ingresosGuardados.length; i++) {
      String ingreso = ingresosGuardados[i][0];
      double monto = ingresosGuardados[i][1];

      IngresoItem ingresoUser = IngresoItem(ingreso: ingreso, monto: monto);

      // Anadir gasto a la lista total de ingresos
      ingresosTotal.add(ingresoUser);
    }
    return ingresosTotal;
  }
}
