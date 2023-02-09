List<double> agregarIva(double precio) {
  double cantidadIVA = precio * 0.16;

  double precioFinal = precio + cantidadIVA;

  return [cantidadIVA, precioFinal];
}
