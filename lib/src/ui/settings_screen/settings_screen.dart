import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_email/cambiar_email_screen.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_nombre/cambiar_nombre_screen.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_password/cambiar_password_screen.dart';
import 'package:octoconta_final/src/ui/settings_screen/settings_buttons.dart';

List<dynamic> elementosParaConfigurar = [
  ['Nombre:', 'Rafael', const CambiarNombreScreen()],
  [
    'Correo electrónico:',
    'rafabeltrans17@gmail.com',
    const CambiarEmailScreen()
  ],
  ['Contraseña:', '********', const CambiarPasswordScreen()],
];

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
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(2.0),
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
              columnSpan: 12,
              child: Column(
                children: <Widget>[
                  ListView.separated(
                    separatorBuilder: (BuildContext context, index) =>
                        const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(color: Color(0xff534677)),
                    ),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: elementosParaConfigurar.length,
                    itemBuilder: (BuildContext context, index) {
                      return TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    elementosParaConfigurar[index][2])),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  elementosParaConfigurar[index][0],
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xff4527A0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  elementosParaConfigurar[index][1],
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xff4527A0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 36.8),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff4527A0),
                                  size: 15,
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.24),
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
