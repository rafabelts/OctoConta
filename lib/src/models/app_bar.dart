import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OctoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic iconoPrincipal;
  final dynamic iconoSecundario;
  final VoidCallback onPressed;
  final String titulo;
  const OctoAppBar(
      {required this.iconoSecundario,
      required this.onPressed,
      required this.iconoPrincipal,
      required this.titulo,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titulo,
        style: GoogleFonts.inter(
            color: const Color(0xFF2a195d),
            fontWeight: FontWeight.bold,
            fontSize: 19.sp),
      ),
      leading: iconoPrincipal,
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: iconoSecundario,
          splashRadius: 1.0,
          iconSize: 45.sp,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
