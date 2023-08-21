import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/constants/colors.dart';
import 'package:octoconta_final/src/ui/calculos_contables/pago_prestamo/pago_prestamo_screen.dart';
// import 'package:octoconta_final/src/ui/settings_screens/items_settings.dart';
// import 'package:provider/provider.dart';

// import '../../constants/colors.dart';
// import '../../models/app_bar.dart';
// import '../../models/pagina_principal/bitacora_gastos/botones_navegacion_bitacora.dart';
// import '../../models/pagina_principal/bitacora_gastos/muestra_categorias.dart';
// import '../../models/pagina_principal/bitacora_gastos/tarjeta_info_saldo.dart';
// import '../../models/pagina_principal/calculos_contables/calculos_contables.dart';
// import '../../services/informacion_bitacora.dart';
// import '../gastos_ingresos/gastos_ingresos_screen.dart';
// import '../settings_screens/pagina_principal_settings.dart';

/* 
  Creacion de la pantalla principal, en ella se muestra al usuario
  el menu de los calculos contables y la parte de la bitacora de gastos. 
*/

class CalculosContables extends StatelessWidget {
  const CalculosContables({super.key});

  static const listaDeCalculos = {
    'Prestamo': {
      'calculo': 'Pago de un prestamo',
      'pantalla': CalculoInteresPrestamoScreen()
    },
    'Honorarios': {
      'calculo': 'Honorarios',
      'pantalla': CalculoInteresPrestamoScreen()
    },
    'Prima Vacacional': {
      'calculo': 'Prima Vacacional',
      'pantalla': CalculoInteresPrestamoScreen()
    },
    'ISR': {
      'calculo': 'Impuesto Sobre Renta (ISR)',
      'pantalla': CalculoInteresPrestamoScreen()
    },
    'IVA': {
      'calculo': 'Impuesto al Valor Agregado (IVA)',
      'pantalla': CalculoInteresPrestamoScreen()
    },
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'Calculos Contables:',
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
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>listaDeCalculos[llave]?['pantalla'] as Widget))),
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


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../constants/colors.dart';
// import 'calculo_seleccionado.dart';

// List<dynamic> listaCalculos = [
//   ['Pago de una tarjeta de crédito', 0],
//   ['Pago de un préstamo', 1],
//   ['Honorarios', 2],
//   ['Prima vacacional', 3],
//   ['Impuesto Sobre Renta (ISR)', 4],
//   ['Impuesto al Valor Agregado (IVA)', 5],
// ];

// /* 
//   Creacion del menu scrolleable de los calculos
//   contables disponibles
// */

// class CalculosContables extends StatelessWidget {
//   const CalculosContables({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final decoracionTarjetaItem = BoxDecoration(
//       borderRadius: BorderRadius.circular(14.0.r),
//       gradient: LinearGradient(
//         begin: Alignment(-0.300.w, -0.400.h),
//         end: Alignment(-1.108.w, 1.800.h),
//         colors: <Color>[
//           primario,
//           const Color.fromARGB(211, 111, 96, 150)
//         ], //2a195d  //2a1861
//         stops: const <double>[0, 1],
//       ),
//     );
//     return SizedBox(
//       width: 375.w,
//       height: MediaQuery.of(context).size.height <= 640 ? 180.h : 150.h,
//       child: PageView.builder(
//         physics: const BouncingScrollPhysics(),
//         controller: PageController(viewportFraction: 0.87.w),
//         itemCount: listaCalculos.length,
//         itemBuilder: (context, index) {
//           return Container(
//             decoration: decoracionTarjetaItem,
//             margin: EdgeInsets.symmetric(horizontal: 8.0.w),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent, elevation: 0),
//               onPressed: () {
//                 // Se hace la navegacion hacia la pantalla del calculo seleccionado
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CalculoSeleccionadoScreen(
//                       calculoSeleccionado: listaCalculos[index][1],
//                     ),
//                   ),
//                 );
//               },
//               child: Text(
//                 listaCalculos[index][0],
//                 style: Theme.of(context).textTheme.labelLarge,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
