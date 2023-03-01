import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/bitacora_botones.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/agregar_articulo/agregar_gasto_input.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/agregar_articulo/categoria_eleccion.dart';

class GastosInputs extends StatefulWidget {
  const GastosInputs({super.key});

  @override
  State<GastosInputs> createState() => _GastosInputsState();
}

class _GastosInputsState extends State<GastosInputs> {
  String categoriaSeleccionada = '';
  int valorCategoria = 0;

  void actualizarValorCategoria(int valor) {
    setState(() {
      switch (valor) {
        case 1:
          categoriaSeleccionada = 'Alimentos';
          break;
        case 2:
          categoriaSeleccionada = 'Salud';
          break;
        case 3:
          categoriaSeleccionada = 'Servicios';
          break;
        case 4:
          categoriaSeleccionada = 'Suscripciones';
          break;
        case 5:
          categoriaSeleccionada = 'Otros';
          break;
      }
    });
  }

  List<int> cantidades = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  late int cantidadReciente = cantidades[0];

  TextEditingController articulo = TextEditingController();
  TextEditingController precio = TextEditingController();

  String mensajeDeErrorArticulo = '';
  bool errorInArticulo = false;
  mensajeErrorArticulo(String mensajeError, bool error) {
    setState(() {
      errorInArticulo = error;
      errorInArticulo == false
          ? false
          : (mensajeDeErrorArticulo = mensajeError);
    });
  }

  String mensajeDeErrorPrecio = '';
  bool errorInPrecio = false;
  mensajeErrorPrecio(String mensajeError, bool error) {
    setState(() {
      errorInPrecio = error;
      errorInPrecio == false ? false : (mensajeDeErrorPrecio = mensajeError);
    });
  }

  String mensajeDeErrorCategoria = "";
  void mensajeErrorCategoria(String mensajeDeError) {
    Text(
      mensajeDeError,
      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }

  onChangedArticulo() => mensajeErrorArticulo('', false);
  onChangedPrecio() => mensajeErrorPrecio('', false);

  void agregar() {
    if (articulo.text.isEmpty) {
      mensajeErrorArticulo(
          'Por favor, agregue un artículo para continuar.', true);
    } else if (precio.text.isEmpty) {
      mensajeErrorPrecio("Por favor, ingrese el precio del artículo.", true);
    } else if (categoriaSeleccionada.isEmpty) {
      setState(() {
        mensajeDeErrorCategoria = "Por favor, ingrese una categoría.";
      });
      mensajeErrorCategoria(mensajeDeErrorCategoria);
    } else {
      mensajeErrorArticulo('', false);
      mensajeErrorPrecio('', false);
      mensajeErrorCategoria('');
    }
  }

  @override
  void initState() {
    super.initState();
    articulo;
    precio;
  }

  @override
  void dispose() {
    super.dispose();
    articulo.dispose();
    precio.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.01),
          child: Column(
            children: <Widget>[
              AgregarGastoInputs(
                articulo: articulo,
                articuloError:
                    errorInArticulo == false ? null : mensajeDeErrorArticulo,
                onChangedPrecio: (value) => onChangedPrecio(),
                cantidades: cantidades,
                cantidadReciente: cantidadReciente,
                precio: precio,
                precioError:
                    errorInPrecio == false ? null : mensajeDeErrorPrecio,
                onChangedArticulo: (value) => onChangedArticulo(),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: CategoriasEleccion(
                    valor: valorCategoria,
                    cambioValor: actualizarValorCategoria,
                  )),
              BotonesBitacora(
                agregar: "Agregar",
                cancelar: "Cancelar",
                agregarOpcion: () => agregar(),
                cancelarOpcion: () => Navigator.pop(context),
              ),
            ],
          ),
        ));
  }
}
