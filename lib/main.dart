import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:octoconta_final/src/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/informacion_gastos_otros.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/saluhigiene/informacion_gastos_saludhi.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/servicios/informacion_gastos_servicios.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suma_gastos_categorias.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suscripciones/informacion_gastos_suscripciones.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/editar_saldo/informacion_saldo.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/informacion_ingreso.dart';
import 'package:octoconta_final/src/widget_tree.dart';
import 'package:provider/provider.dart';

// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter(); // Se inicia la base de datos

  await Hive.openBox('base_datos_gastos');
  await Hive.openBox('base_datos_ingresos');

  //  Statusbar transparente
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InformacionGastosAlimentos>(
          create: (_) => InformacionGastosAlimentos(),
        ),
        ChangeNotifierProvider<InformacionGastosSaludHigiene>(
          create: (_) => InformacionGastosSaludHigiene(),
        ),
        ChangeNotifierProvider<InformacionGastosServicios>(
          create: (_) => InformacionGastosServicios(),
        ),
        ChangeNotifierProvider<InformacionGastosSuscripciones>(
          create: (_) => InformacionGastosSuscripciones(),
        ),
        ChangeNotifierProvider<InformacionGastosOtros>(
          create: (_) => InformacionGastosOtros(),
        ),
        ChangeNotifierProvider<InformacionIngresos>(
          create: (_) => InformacionIngresos(),
        ),
        ChangeNotifierProvider<SumaTotalGastos>(
          create: (_) => SumaTotalGastos(),
        ),
        ChangeNotifierProvider<InformacionSaldoUsuario>(
            create: (_) => InformacionSaldoUsuario()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OctoContaThemes.lightTheme,
        home: const WidgetTree(),
      ),
    );
  }
}
