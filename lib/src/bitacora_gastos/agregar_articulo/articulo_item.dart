/* 
  Creo el articulo de gasto para guardarlo en el provider
*/

class ArticuloGastoItem {
  final int cantidad;
  final String articulo;
  final double precio;
  final String categoria;

  ArticuloGastoItem({
    required this.cantidad,
    required this.articulo,
    required this.precio,
    required this.categoria,
  });
}
