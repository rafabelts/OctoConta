import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/services/auth.dart';

class SettingsButton extends StatelessWidget {
  SettingsButton({super.key});
  final user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: const Color(0xff4527A0),
              padding: const EdgeInsets.symmetric(vertical: 9.0),
            ),
            child: Text(
              'Cerrar Sesión',
              style: GoogleFonts.inter(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 27),
            ),
            onPressed: () => signOut(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Eliminar Cuenta',
              style: GoogleFonts.poppins(
                color: const Color(0xff5e35b1),
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
