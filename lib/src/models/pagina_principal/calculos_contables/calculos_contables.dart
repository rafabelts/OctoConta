import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/constants/colors.dart';
import 'package:octoconta_final/src/models/app_bar.dart';
import 'package:octoconta_final/src/models/pagina_principal/alert_dialogs.dart';
import 'package:octoconta_final/src/ui/calculos_contables/honorarios/honorarios_screen.dart';
import 'package:octoconta_final/src/ui/calculos_contables/honorarios/info_honorarios.dart';
import 'package:octoconta_final/src/ui/calculos_contables/isr/info_isr.dart';
import 'package:octoconta_final/src/ui/calculos_contables/isr/isr_screen.dart';
import 'package:octoconta_final/src/ui/calculos_contables/iva/info_iva.dart';
import 'package:octoconta_final/src/ui/calculos_contables/iva/iva_screen.dart';
import 'package:octoconta_final/src/ui/calculos_contables/pago_prestamo/info_pago_prestamo.dart';
import 'package:octoconta_final/src/ui/calculos_contables/pago_prestamo/pago_prestamo_screen.dart';
import 'package:octoconta_final/src/ui/calculos_contables/prima_vacacional/info_prima_vacacional.dart';
import 'package:octoconta_final/src/ui/calculos_contables/prima_vacacional/prima_vacacional_screen.dart';

/* 
  Creacion de la pantalla principal, en ella se muestra al usuario
  el menu de los calculos contables y la parte de la bitacora de gastos. 
*/

class CalculosContables extends StatelessWidget {
  const CalculosContables({super.key});

  static const listaDeCalculos = {
    'Prestamo': {
      'calculo': 'Pago de un préstamo',
      'pantalla': CalculoInteresPrestamoScreen(),
      'info': InfoPagoPrestamo(),
    },
    'Honorarios': {
      'calculo': 'Honorarios',
      'pantalla': CalculoHonorariosScreen(),
      'info': InfoHonorarios(),
    },
    'Prima Vacacional': {
      'calculo': 'Prima Vacacional',
      'pantalla': CalculoPrimaVacacionalScreen(),
      'info': InfoPrimaVacacional(),
    },
    'ISR': {
      'calculo': 'Impuesto Sobre Renta (ISR)',
      'pantalla': CalculoISRScreen(),
      'info': InfoISR(),
    },
    'IVA': {
      'calculo': 'Impuesto al Valor Agregado (IVA)',
      'pantalla': CalculoIVAScreen(),
      'info': InfoIVA(),
    },
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'Cálculos Contables:',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: 10.h,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: listaDeCalculos.length,
            itemBuilder: (context, index) {
              final llave = listaDeCalculos.keys.elementAt(index);
              return Container(
                  margin: EdgeInsets.all(6.sp),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 6,
                    child: ListTile(
                      tileColor: primario,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: OctoAppBar(
                              iconoPrincipal: IconButton(
                                icon: Icon(Icons.arrow_back_ios, size: 30.sp),
                                onPressed: () => Navigator.pop(context),
                              ),
                              titulo: (listaDeCalculos[llave]!['calculo'] ==
                                          'Impuesto Sobre Renta (ISR)'
                                      ? 'Cálculo ISR'
                                      : listaDeCalculos[llave]!['calculo'] ==
                                              'Impuesto al Valor Agregado (IVA)'
                                          ? 'Cálculo IVA'
                                          : listaDeCalculos[llave]!['calculo'])
                                  as String,
                              iconoSecundario: const Icon(Icons.info_outline),
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => OctoAlertDialogs(
                                  contenidoDelDialog:
                                      listaDeCalculos[llave]!['info'] as Widget,
                                ),
                              ),
                            ),
                            body: Center(
                              child: SingleChildScrollView(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 20.h),
                                child: listaDeCalculos[llave]?['pantalla']
                                    as Widget,
                              ),
                            ),
                          ),
                        ),
                      ),
                      splashColor: botonPrimarioColor,
                      title: Center(
                        child: Text(
                          '${listaDeCalculos[llave]?['calculo']}',
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
