import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/constants/colors.dart';
import 'package:octoconta_final/src/models/app_bar.dart';
import 'package:octoconta_final/src/models/pagina_principal/alert_dialogs.dart';
import 'package:octoconta_final/src/models/pagina_principal/botones_settings.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/settings_screens/cerrar_sesion_screen/contenido_dialog_cerrar_sesion.dart';
import 'package:octoconta_final/src/ui/settings_screens/contrasena_screen/cambio_contrasena_screen.dart';
import 'package:octoconta_final/src/ui/settings_screens/correo_screen/cambio_correo_screen.dart';
import 'package:octoconta_final/src/ui/settings_screens/eliminar_cuenta_screen/contenido_dialog_eliminar_cuenta.dart';
import 'package:octoconta_final/src/ui/settings_screens/nombre_screen/cambio_nombre_screen.dart';

class Configuracion extends StatelessWidget {
  const Configuracion({super.key});

  @override
  Widget build(BuildContext context) {
    final opciones = {
      'Nombre': {
        'contenido': Auth().currentUser?.displayName ?? '',
        'pantalla': const CambioNombreScreen(),
      },
      'Correo electrónico': {
        'contenido': Auth().currentUser?.email ?? '',
        'pantalla': const CambioCorreoScreen(),
      },
      'Contraseña': {
        'contenido': '********',
        'pantalla': const CambioPasswordScreen(),
      },
    };
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Configuración:',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: opciones.length,
              itemBuilder: (context, index) {
                final cambios = opciones.keys.toList()[index];
                final llaves = opciones.keys.elementAt(index);
                return Align(
                  alignment: Alignment.bottomLeft,
                  child: ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(
                            appBar: OctoAppBar(
                              iconoSecundario: const Icon(null),
                              onPressed: () {},
                              iconoPrincipal: IconButton(
                                splashColor: Colors.transparent,
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: 28.sp,
                                ),
                              ),
                              titulo: '',
                            ),
                            body: SafeArea(
                              child: SingleChildScrollView(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 10.w),
                                child: opciones[llaves]?['pantalla'] as Widget,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    splashColor: Colors.transparent,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$cambios:',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: primario,
                              size: 20,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '${opciones[llaves]?['contenido']}',
                          style: GoogleFonts.poppins(
                            color: botonSecundarioColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          color: botonSecundarioColor,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            BotonesSettings(
              accion: 'Cerrar Sesión',
              funcion: () => showDialog(
                context: context,
                builder: (context) => const OctoAlertDialogs(
                    contenidoDelDialog: ContenidoDialogCerrarSesion()),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.w),
              child: TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const OctoAlertDialogs(
                      contenidoDelDialog: ContenidoDialogEliminarCuenta()),
                ),
                child: Text(
                  'Eliminar Cuenta',
                  style: GoogleFonts.inter(
                    color: botonSecundarioColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
