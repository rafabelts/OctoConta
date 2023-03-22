import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/bitacora_gastos/agregar_articulo/agregar_articulo.dart';

import '../../constants/colors.dart';
import '../../models/pagina_principal/bitacora_gastos/botones_categorias/botones_categorias.dart';
import '../../models/pagina_principal/bitacora_gastos/entradas_bitacora/botones_bitacora.dart';
import '../../models/pagina_principal/bitacora_gastos/entradas_bitacora/entradas_bitacora.dart';
import '../../models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';
import '../../models/pagina_principal/calculos_contables/periodos_pago.dart';

/* Creo el modal que permite a los usuarios agregar informacion
  sobre algun gasto realizado*/

class ContenidoModalAgregarGasto extends StatefulWidget {
  const ContenidoModalAgregarGasto({super.key});

  @override
  State<ContenidoModalAgregarGasto> createState() =>
      _ContenidoModalAgregarGastoState();
}

class _ContenidoModalAgregarGastoState
    extends State<ContenidoModalAgregarGasto> {
  TextEditingController articulo = TextEditingController();
  TextEditingController precio = TextEditingController();

  @override
  void dispose() {
    articulo.dispose();
    precio.dispose();
    super.dispose();
  }

  bool hayValorArticulo = true;

  void validarValorArticulo(bool valido) {
    setState(() {
      hayValorArticulo = valido;
    });
  }

  bool hayValorPrecio = true;

  void validarValorPrecio(bool valido) {
    setState(() {
      hayValorPrecio = valido;
    });
  }

  String cantidadActual = '1';
  void actualizarCantidad(String? nuevoPeriodo) {
    setState(() {
      cantidadActual = nuevoPeriodo!;
    });
  }

  Map<int, String> categorias = {
    1: 'Alimentos',
    2: 'Salud',
    3: 'Servicios',
    4: 'Suscripciones',
    5: 'Otros',
  };

  String categoriaSeleccionada = '';
  int valorCategoria = 0;

  void actualizarValorCategoria(int valor) {
    setState(() {
      categoriaSeleccionada = categorias[valor]!;
      valorCategoria = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    AgregarArticulo agregarArticulo = AgregarArticulo(
      contexto: context,
      articulo: articulo,
      precio: precio,
      actualizarCategoria: actualizarValorCategoria,
      categoriaSeleccionada: categoriaSeleccionada,
      validarArticulo: validarValorArticulo,
      validarPrecio: validarValorPrecio,
      actualizarCantidad: actualizarCantidad,
      cantidadActual: cantidadActual,
    );
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nombre del artículo:",
            textAlign: TextAlign.justify,
            style: GoogleFonts.inter(
              color: secundario,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
            ),
          ),
          EntradaBitacora(
              controlador: articulo,
              onComplete: agregarArticulo.onCompleteArticulo,
              onChanged: (value) => agregarArticulo.onChanged(),
              hayValor: hayValorArticulo),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Text(
              "Cantidad y precio del artículo: (\$ MXN)",
              textAlign: TextAlign.justify,
              style: GoogleFonts.inter(
                color: secundario,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height <= 640
                        ? 30.h
                        : 10.h),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: DropdownPeriodoSalario(
                    periodos: agregarArticulo.cantidades,
                    cambiarPeriodo: actualizarCantidad,
                    periodoActual: cantidadActual,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: EntradaCalculos(
                    controlador: precio,
                    onComplete: agregarArticulo.onCompletePrecio,
                    onChanged: (value) => agregarArticulo.onChanged(),
                    hayValor: hayValorPrecio),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Text(
              "Seleccionar categoría:",
              textAlign: TextAlign.justify,
              style: GoogleFonts.inter(
                color: secundario,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: CategoriasEleccion(
                valor: valorCategoria,
                cambioValor: actualizarValorCategoria,
              )),
          Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: BotonesBitacora(
              agregar: agregarArticulo.agregarArticulo,
              cancelar: agregarArticulo.cancelar,
            ),
          ),
        ],
      ),
    );
  }
}
