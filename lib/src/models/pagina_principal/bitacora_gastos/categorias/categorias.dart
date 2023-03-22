import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/models/app_bar.dart';

class CategoriasFinanzas extends StatelessWidget {
  final String titulo;
  final Widget? contenido;
  const CategoriasFinanzas({required this.titulo, this.contenido, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OctoAppBar(
        titulo: titulo,
        iconoPrincipal: IconButton(
          splashRadius: 1.0,
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 26.sp),
        ),
        iconoSecundario: const Icon(null),
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: contenido,
      ),
    );
  }
}
