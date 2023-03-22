import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/ui/settings_screens/items_settings.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/app_bar.dart';
import '../../models/pagina_principal/bitacora_gastos/botones_navegacion_bitacora.dart';
import '../../models/pagina_principal/bitacora_gastos/muestra_categorias.dart';
import '../../models/pagina_principal/bitacora_gastos/tarjeta_info_saldo.dart';
import '../../models/pagina_principal/calculos_contables/calculos_contables.dart';
import '../../services/informacion_bitacora.dart';
import '../gastos_ingresos/gastos_ingresos_screen.dart';
import '../settings_screens/pagina_principal_settings.dart';

/* 
  Creacion de la pantalla principal, en ella se muestra al usuario
  el menu de los calculos contables y la parte de la bitacora de gastos. 
*/

class PaginaPrincipalScreen extends StatelessWidget {
  const PaginaPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double saldoUsuarioAgregado =
        Provider.of<InformacionBitacora>(context, listen: false)
            .prepararSaldo();
    double gastoUsuario =
        Provider.of<InformacionBitacora>(context, listen: true)
            .prepararTotalGastos()[0];

    double ingresoUsuario =
        Provider.of<InformacionBitacora>(context, listen: true)
            .prepararTotalIngresos();
    double saldoTotal = saldoUsuarioAgregado + ingresoUsuario - gastoUsuario;
    return Scaffold(
      appBar: OctoAppBar(
        titulo: '',
        iconoPrincipal: const Icon(null),
        iconoSecundario: const Icon(Icons.settings_outlined),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PaginaPrincipalSettings(
                      contenido: ElementosSettings(),
                      tituloPantalla: 'Configuración',
                    ))),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller:
              ScrollController(keepScrollOffset: true, initialScrollOffset: 0),
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: 10.0.h,
            left: 15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Cálculos contables:",
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                child: const CalculosContables(),
              ),
              Divider(
                thickness: 0.5,
                color: primario,
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h, bottom: 20.h),
                child: Text(
                  "Gastos:",
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: TarjetaInfoSaldo(
                  opcion: 'Saldo',
                  total: saldoTotal,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: BotonNavegacionBitacora(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GastosEIngresosScreen())),
                  pantallaAIr: 'Agregar gasto o ingreso',
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: 20.w, bottom: 50.w, right: 30.w, left: 15.w),
                  child: const MuestraDeCategoriaConCantidades()),
            ],
          ),
        ),
      ),
    );
  }
}
