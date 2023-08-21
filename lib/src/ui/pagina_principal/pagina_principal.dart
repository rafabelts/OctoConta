import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:octoconta_final/src/models/floating_b.dart';
import 'package:octoconta_final/src/models/pagina_principal/calculos_contables/calculos_contables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/constants/colors.dart';
import 'package:octoconta_final/src/ui/finanzas/finanzas_screen.dart';

import 'package:octoconta_final/src/ui/settings_screens/settings_screen.dart';
// import 'package:octoconta_final/src/models/pagina_principal/calculos_contables/calculos_contables.dart';
// import 'package:octoconta_final/src/selectedScreenrincipal/calculos_contables/calculos_contables.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _showFab = false;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _showFab = true;
      });
    }
  }

  int selectedScreen = 0;

  static const screens = {
    0: CalculosContables(),
    1: PantallaFinanzas(),
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
      floatingActionButton:
          _showFab && selectedScreen == 1 ? const OctoFloatingButton() : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
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
        items: const <BottomNavigationBarItem>[
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
