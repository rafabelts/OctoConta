import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 
  Creo el fondo del modal dialog que se mostrara en diversas partes
  de la app, las cuales son las partes en la seleccion del proceso de Iva
  y al ingresar un gasto o ingreso.
*/

class OctoModal extends StatelessWidget {
  final Widget contenidoDelModal;
  const OctoModal({required this.contenidoDelModal, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: contenidoDelModal,
      ),
    );
  }
}
