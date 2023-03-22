import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../ui/calculos_contables/honorarios/honorarios_screen.dart';
import '../../../ui/calculos_contables/honorarios/info_honorarios.dart';
import '../../../ui/calculos_contables/isr/info_isr.dart';
import '../../../ui/calculos_contables/isr/isr_screen.dart';
import '../../../ui/calculos_contables/iva/info_iva.dart';
import '../../../ui/calculos_contables/iva/iva_screen.dart';
import '../../../ui/calculos_contables/pago_prestamo/info_pago_prestamo.dart';
import '../../../ui/calculos_contables/pago_prestamo/pago_prestamo_screen.dart';
import '../../../ui/calculos_contables/pago_tarjeta/info_pago_tarjeta.dart';
import '../../../ui/calculos_contables/pago_tarjeta/pago_tarjeta_screen.dart';
import '../../../ui/calculos_contables/prima_vacacional/info_prima_vacacional.dart';
import '../../../ui/calculos_contables/prima_vacacional/prima_vacacional_screen.dart';
import '../../app_bar.dart';
import '../alert_dialogs.dart';
import 'items_drawer_calculos.dart';

/*
  Se muestra la pantalla del calculo seleccionado, y de igual forma
  se crea un menu drawer para la muestra de los calculos contables que de
  momento se encuentran en la aplicacion.
*/

class CalculoSeleccionadoScreen extends StatefulWidget {
  final int calculoSeleccionado;
  const CalculoSeleccionadoScreen(
      {required this.calculoSeleccionado, super.key});

  @override
  State<CalculoSeleccionadoScreen> createState() =>
      _CalculoSeleccionadoScreenState();
}

class _CalculoSeleccionadoScreenState extends State<CalculoSeleccionadoScreen> {
  late int pantallaSeleccionada = widget.calculoSeleccionado;

  Map<int, Widget> pantallasCalculo = {
    0: const CalculoInteresTarjetaScreen(),
    1: const CalculoInteresPrestamoScreen(),
    2: const CalculoHonorariosScreen(),
    3: const CalculoPrimaVacacionalScreen(),
    4: const CalculoISRScreen(),
    5: const CalculoIVAScreen(),
  };

  Map<int, String> titulosPantallas = {
    0: 'Interés de tarjeta',
    1: 'Pago prestamo',
    2: 'Honorarios',
    3: 'Prima vacacional',
    4: 'Cálculo de ISR',
    5: 'Cálculo de IVA',
  };

  Map<int, Widget> infoCalculos = {
    0: const InfoPagoTarjeta(),
    1: const InfoPagoPrestamo(),
    2: const InfoHonorarios(),
    3: const InfoPrimaVacacional(),
    4: const InfoISR(),
    5: const InfoIVA()
  };

  void cambioPantalla(int nuevaPantalla) {
    Navigator.pop(context);
    setState(() {
      pantallaSeleccionada = nuevaPantalla;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OctoAppBar(
        iconoPrincipal: Builder(
          builder: (context) => IconButton(
            splashRadius: 1.0,
            onPressed: () {
              FocusManager.instance.primaryFocus!.unfocus();
              FocusScope.of(context).unfocus();
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.sort,
              size: 30.sp,
            ),
          ),
        ),
        iconoSecundario: const Icon(Icons.info_outline),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => OctoAlertDialogs(
            contenidoDelDialog: infoCalculos[pantallaSeleccionada]!,
          ),
        ),
        /*
          Condicional sobre de acuerdo a que pantalla se selecciono es que
          se muestra el titulo del app bar.
        */
        titulo: titulosPantallas[pantallaSeleccionada]!,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller:
              ScrollController(keepScrollOffset: true, initialScrollOffset: 0),
          padding:
              EdgeInsets.only(top: 20.h, bottom: 5.h, left: 20.w, right: 20.w),
          physics: const BouncingScrollPhysics(),
          child: pantallasCalculo[pantallaSeleccionada],
        ),
      ),
      drawer: Drawer(
          backgroundColor: fondoColor,
          child: SafeArea(
            child: DrawerCalculosItems(
              indexScreen: pantallaSeleccionada,
              cambioPantalla: cambioPantalla,
            ),
          )),
    );
  }
}
