class informacionIngresos {
  // Lista de los gastos
  List listaIngresos = [];

  // Se obtiene la lista cuando se llama
  List obtenerListaIngresos() {
    return listaIngresos;
  }

  // agregar nuevo gasto
  void agregarNuevoIngreso(nuevoGasto) {
    listaIngresos.add(nuevoGasto);
  }

  // Eliminar gasto
  void eliminarNuevoIngreso(gasto) {
    listaIngresos.remove(gasto);
  }
}
