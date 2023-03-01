class informacionGastos {
  // Lista de los gastos
  List listaGastos = [];

  // Se obtiene la lista cuando se llama
  List obtenerListaGastos() {
    return listaGastos;
  }

  // agregar nuevo gasto
  void agregarNuevoGasto(nuevoGasto) {
    listaGastos.add(nuevoGasto);
  }

  // Eliminar gasto
  void eliminarNuevoGasto(gasto) {
    listaGastos.remove(gasto);
  }
}
