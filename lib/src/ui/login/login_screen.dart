import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/ui/login/login_buttons.dart';
import 'package:octoconta_final/src/ui/login/login_inputs.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

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
            padding: const EdgeInsets.all(2.0),
            child: AdaptiveColumn(
              children: <AdaptiveContainer>[
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      LogInInputs(),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      LogInButtons(),
                    ],
                  ),
                ),
              ],
            )));
  }
}
