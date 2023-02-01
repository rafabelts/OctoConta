import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreensAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? icono;
  final String? titulo;
  final VoidCallback onPressed;
  const ScreensAppBar(
      {required this.onPressed, this.icono, this.titulo, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titulo!,
        style: GoogleFonts.inter(
            color: const Color(0xFF2a195d),
            fontWeight: FontWeight.bold,
            fontSize: 28),
      ),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
          FocusScope.of(context).unfocus();
        },
        icon: const Icon(Icons.sort),
        iconSize: 40,
      ),
      actions: <Widget>[
        IconButton(
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
