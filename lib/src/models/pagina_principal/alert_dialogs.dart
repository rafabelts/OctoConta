import 'package:flutter/material.dart';

/* 
  Creo el fondo del alert dialog que se mostrara en diversas partes
  de la app, las cuales son en las partes de info de los calculos, 
  el cerrar sesion y la eliminacion de cuenta.
*/

class OctoAlertDialogs extends StatelessWidget {
  final Widget contenidoDelDialog;
  const OctoAlertDialogs({required this.contenidoDelDialog, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: contenidoDelDialog,
        ),
      ),
    );
  }
}
