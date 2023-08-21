import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/pagina_principal/calculos_contables/calculos_contables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/constants/colors.dart';

import 'package:octoconta_final/src/ui/settings_screens/settings_screen.dart';
// import 'package:octoconta_final/src/models/pagina_principal/calculos_contables/calculos_contables.dart';
// import 'package:octoconta_final/src/selectedScreenrincipal/calculos_contables/calculos_contables.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int selectedScreen = 0;

  static const screens = {
    0: CalculosContables(),
    1: Center(child: Text('a')),
    2: Configuracion(),
  };

  void cambiarPantalla(int indice) {
    setState(() {
      selectedScreen = indice;
    });
    print(selectedScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.sp),
        child: screens[selectedScreen],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: fondoColor,
        currentIndex: selectedScreen,
        onTap: cambiarPantalla,
        elevation: 15,
        iconSize: 32.sp,
        selectedItemColor: botonPrimarioColor,
        items: [
          BottomNavigationBarItem(
            label: 'Cálculos',
            icon: Icon(Icons.calculate_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Finanzas',
            icon: Icon(Icons.wallet),
          ),
          BottomNavigationBarItem(
            label: 'Configuración',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
