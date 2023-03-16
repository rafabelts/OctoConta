import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreensAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData icono;
  final dynamic leadingIcon;
  final String titulo;
  final VoidCallback onPressed;
  const ScreensAppBar(
      {required this.onPressed,
      required this.leadingIcon,
      required this.icono,
      required this.titulo,
      super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      title: Text(
        titulo,
        style: GoogleFonts.inter(
            color: const Color(0xFF2a195d),
            fontWeight: FontWeight.bold,
            fontSize: width <= 360 ? 22 : 28),
      ),
      leading: leadingIcon,
      actions: <Widget>[
        IconButton(
          splashRadius: 1.0,
          onPressed: onPressed,
          icon: Icon(icono),
          iconSize: 40,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
