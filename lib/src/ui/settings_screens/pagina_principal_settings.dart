import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/models/app_bar.dart';

class PaginaPrincipalSettings extends StatelessWidget {
  final Widget? contenido;
  final String? tituloPantalla;
  const PaginaPrincipalSettings({
    this.contenido,
    this.tituloPantalla,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OctoAppBar(
        titulo: tituloPantalla!,
        iconoPrincipal: IconButton(
          splashRadius: 1.0,
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 26.sp),
        ),
        iconoSecundario: const Icon(null),
        onPressed: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller:
              ScrollController(keepScrollOffset: true, initialScrollOffset: 0),
          padding:
              EdgeInsets.only(top: 20.h, bottom: 5.h, left: 20.w, right: 20.w),
          physics: const BouncingScrollPhysics(),
          child: contenido,
        ),
      ),
    );
  }
}
