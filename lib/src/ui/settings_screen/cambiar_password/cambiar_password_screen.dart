import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_password/cambiar_password_inputs.dart';

class CambiarPasswordScreen extends StatelessWidget {
  const CambiarPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AdaptiveColumn(
            children: <AdaptiveContainer>[
              AdaptiveContainer(
                columnSpan: 12,
                child: const CambiarPasswordInput(),
              )
            ],
          )),
    );
  }
}
