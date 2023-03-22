import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/bitacora_gastos/agregar_articulo/articulo_item.dart';
import 'package:octoconta_final/src/services/informacion_bitacora.dart';
import 'package:octoconta_final/src/models/pagina_principal/bitacora_gastos/botones_categorias/botones_categorias.dart';
import 'package:octoconta_final/src/models/pagina_principal/modal_bottom.dart';
import 'package:provider/provider.dart';

import '../../models/mensaje_scaffold.dart';

/*
  Creo la funcionalidad que tendra la parte de agregar un gasto
  en esta se crea el contenido de un modal y se agregaran providers
  para poder manejar los estado  String cantidadActual = '1';
s dentro de diferentes widgets.
*/
class AgregarArticulo {
  final BuildContext contexto;
  final TextEditingController articulo;
  final TextEditingController precio;
  final void Function(String nuevoPeriodo) actualizarCantidad;
  final dynamic actualizarCategoria;
  final Function(bool) validarArticulo;
  final Function(bool) validarPrecio;

  String cantidadActual;
  List<String> cantidades = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  String categoriaSeleccionada;

  void onChanged() {
    if (articulo.text.isNotEmpty) {
      validarArticulo(true);
    }

    if (precio.text.isNotEmpty) {
      validarPrecio(true);
    }
  }

  void onCompleteArticulo() {
    if (articulo.text.isEmpty) {
      validarArticulo(false);
    } else {
      FocusScope.of(contexto).nextFocus();
      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompletePrecio() {
    if (precio.text.isEmpty) {
      validarPrecio(false);
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
    }
  }

  void agregarArticulo() {
    if (articulo.text.isEmpty) {
      validarArticulo(false);
    } else if (precio.text.isEmpty) {
      validarPrecio(false);
    } else if (categoriaSeleccionada == '') {
      Navigator.pop(contexto);
      MensajeScaffold(
        contexto: contexto,
        mensaje:
            'Error: No se indico la categoría del artículo. Por favor, ingrese una categoría.',
      ).mostrar();
    } else {
      double? precioArticulo = int.tryParse(cantidadActual)! *
          double.parse(precio.text.replaceAll(',', ''));

      ArticuloGastoItem gasto = ArticuloGastoItem(
          cantidad: int.tryParse(cantidadActual)!,
          articulo: articulo.text,
          precio: precioArticulo,
          categoria: categoriaSeleccionada);

      Provider.of<InformacionBitacora>(contexto, listen: false)
          .agregarGasto(gasto.categoria, gasto);
      Navigator.pop(contexto);
    }
  }

  void cancelar() {
    articulo.clear();
    precio.clear();
    Navigator.pop(contexto);
  }

  AgregarArticulo({
    required this.contexto,
    required this.articulo,
    required this.precio,
    required this.actualizarCantidad,
    required this.actualizarCategoria,
    required this.categoriaSeleccionada,
    required this.cantidadActual,
    required this.validarArticulo,
    required this.validarPrecio,
  });
}
