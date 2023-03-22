import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/constants/colors.dart';

class CategoriasEleccion extends StatefulWidget {
  final int valor;
  final Function(int) cambioValor;
  const CategoriasEleccion(
      {required this.valor, required this.cambioValor, super.key});

  @override
  State<CategoriasEleccion> createState() => _CategoriasEleccionState();
}

class _CategoriasEleccionState extends State<CategoriasEleccion> {
  late int valor;

  @override
  void initState() {
    super.initState();
    valor = widget.valor;
  }

  Widget customRadioBoton(String categoria, String imagenCategoriaSeleccionada,
      String imagenCategoria, int index) {
    return ElevatedButton(
      onPressed: () {
        widget.cambioValor(index);
        setState(() {
          valor = index;
        });
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(
            vertical: 6.h,
            horizontal: MediaQuery.of(context).size.width <= 360 ? 4.w : 12.w),
        side: BorderSide(color: secundario),
        backgroundColor: valor == index ? secundario : fondoColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: valor == index
                ? AssetImage(imagenCategoriaSeleccionada)
                : AssetImage(imagenCategoria),
            width: 60.w,
          ),
          Text(
            categoria,
            style: GoogleFonts.inter(
                color: valor == index
                    ? Theme.of(context).scaffoldBackgroundColor
                    : entradaUsuarioColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Row(
            children: [
              customRadioBoton("Alimentos", "images/categorias/alimentos.png",
                  "images/categorias/alimentosNoSeleccionado.png", 1),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                child: customRadioBoton("Salud", "images/categorias/salud.png",
                    "images/categorias/saludNoSeleccionado.png", 2),
              ),
              customRadioBoton("Servicios", "images/categorias/servicios.png",
                  "images/categorias/serviciosNoSeleccionado.png", 3),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.09),
                child: customRadioBoton(
                    "Suscripciones",
                    "images/categorias/suscripciones.png",
                    "images/categorias/suscripcionesNoSeleccionado.png",
                    4),
              ),
              customRadioBoton("Otros", "images/categorias/otros.png",
                  "images/categorias/otrosNoSeleccionado.png", 5),
            ],
          ),
        ),
      ],
    );
  }
}
