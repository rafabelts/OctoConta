import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_email/cambiar_email_screen.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_nombre/cambiar_nombre_screen.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_password/cambiar_password_screen.dart';
import 'package:octoconta_final/src/ui/settings_screen/settings_buttons.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configuracion',
          style: GoogleFonts.inter(
              color: const Color(0xFF2a195d),
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(2.0),
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
              columnSpan: 12,
              child: Column(
                children: <Widget>[
                  const CambiarNombreButton(),
                  const Divider(thickness: 0.5, color: Color(0xff534677)),
                  const CambiarEmailButton(),
                  const Divider(thickness: 0.5, color: Color(0xff534677)),
                  const CambiarPasswordButton(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.4),
                    child: const SettingsButton(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
