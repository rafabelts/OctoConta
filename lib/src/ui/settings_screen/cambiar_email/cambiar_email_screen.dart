import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_email/cambiar_email_inputs.dart';

class CambiarEmailScreen extends StatelessWidget {
  const CambiarEmailScreen({super.key});

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
        padding: const EdgeInsets.all(5.0),
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
              columnSpan: 12,
              child: const CambiarEmailInput(),
            )
          ],
        ),
      ),
    );
  }
}
