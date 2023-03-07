import 'package:hive_flutter/hive_flutter.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';

class BaseDatosDeGastos {
  // Referencia la box
  final _mybox = Hive.box("base_datos_gastos");

  // escribir datos gasto
  void guardarGasto(List<GastoItem> gastos) {
    List<List<dynamic>> gastosFormateados = [];

    for (var gasto in gastos) {
      List<dynamic> gastoFormateado = [
        gasto.cantidad,
        gasto.articulo,
        gasto.precio,
        gasto.categoria
      ]; // Vamos sacando los datos del gasto item para poder almacenarlos en la data base
      gastosFormateados.add(gastoFormateado);
    }

    // Guardar en la base de datos
    _mybox.put('Gastos_totales', gastosFormateados);
  }

  // Guardar valor total de gastos
  void totalDeGastos(double obtenerTotal) {
    double totalIngresos = obtenerTotal;
    _mybox.put("Gastos_total", totalIngresos);
  }

  // Leer total gastos
  double leerTotalGastos() {
    return _mybox.get("Gastos_total", defaultValue: 0.0);
  }

  // leer datos
  Map<String, List<GastoItem>> leerDatosGastos() {
    List gastosGuardados = _mybox.get('Gastos_totales') ?? [];
    Map<String, List<GastoItem>> gastosTotales = {
      'Alimentos': [],
      'Salud': [],
      'Servicios': [],
      'Suscripciones': [],
      'Otros': [],
    };

    for (int i = 0; i < gastosGuardados.length; i++) {
      int cantidad = gastosGuardados[i][0];
      String articulo = gastosGuardados[i][1];
      double precio = gastosGuardados[i][2];
      String categoria = gastosGuardados[i][3];

      GastoItem gasto = GastoItem(
          cantidad: cantidad,
          articulo: articulo,
          precio: precio,
          categoria: categoria);

      // Anadir gasto a la lista total de los gastos
      switch (gasto.categoria) {
        case 'Alimentos':
          gastosTotales['Alimentos']!.add(gasto);
          break;

        case 'Salud':
          gastosTotales['Salud']!.add(gasto);
          break;

        case 'Servicios':
          gastosTotales['Servicios']!.add(gasto);
          break;

        case 'Suscripciones':
          gastosTotales['Suscripciones']!.add(gasto);
          break;

        case 'Otros':
          gastosTotales['Otros']!.add(gasto);
          break;
      }
    }

    return gastosTotales;
  }
}
