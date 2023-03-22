import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/pagina_principal/alert_dialogs.dart';
import 'package:octoconta_final/src/ui/pagina_principal/pagina_principal.dart';
import 'package:octoconta_final/src/ui/settings_screens/cerrar_sesion_screen/contenido_dialog_cerrar_sesion.dart';
import 'package:octoconta_final/src/ui/settings_screens/correo_screen/cambio_correo_screen.dart';
import 'package:octoconta_final/src/ui/settings_screens/eliminar_cuenta_screen/contenido_dialog_eliminar_cuenta.dart';
import 'package:octoconta_final/src/ui/settings_screens/pagina_principal_settings.dart';
import 'package:octoconta_final/src/ui/settings_screens/contrasena_screen/cambio_contrasena_screen.dart';

import '../../constants/colors.dart';
import '../../models/pagina_principal/botones_settings.dart';
import '../../services/auth.dart';
import 'nombre_screen/cambio_nombre_screen.dart';

class ElementosSettings extends StatelessWidget {
  const ElementosSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final String? nombreUsuario = Auth().currentUser?.displayName;
    final String? correoUsuario = Auth().currentUser?.email;

    List<dynamic> elementos = [
      [
        'Nombre:',
        nombreUsuario ?? '',
        const PaginaPrincipalSettings(
          tituloPantalla: 'Cambio nombre',
          contenido: CambioNombreScreen(),
        )
      ],
      [
        'Correo electrónico:',
        correoUsuario ?? '',
        const PaginaPrincipalSettings(
          tituloPantalla: 'Cambio correo',
          contenido: CambioCorreoScreen(),
        )
      ],
      [
        'Contraseña:',
        '********',
        const PaginaPrincipalSettings(
          tituloPantalla: 'Cambio contraseña',
          contenido: CambioPasswordScreen(),
        )
      ]
    ];
    return Column(
      children: [
        ListView.separated(
          separatorBuilder: (BuildContext context, index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(color: Color(0xff534677)),
          ),
          shrinkWrap: true,
          primary: false,
          itemCount: elementos.length,
          itemBuilder: (BuildContext context, index) {
            return TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => elementos[index][2]),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        elementos[index][0],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        width: 250.w,
                        child: Text(
                          elementos[index][1],
                          style: GoogleFonts.poppins(
                            color: botonSecundarioColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: botonSecundarioColor,
                        size: 15.sp,
                      ))
                ],
              ),
            );
          },
        ),
        BotonesSettings(
          accion: 'Cerrar Sesión',
          cancelar: 'Eliminar Cuenta',
          calcular: () => showDialog(
            context: context,
            builder: (context) => OctoAlertDialogs(
                contenidoDelDialog: const ContenidoDialogCerrarSesion()),
          ),
          limpiar: () => showDialog(
            context: context,
            builder: (context) => OctoAlertDialogs(
                contenidoDelDialog: ContenidoDialogEliminarCuenta()),
          ),
        )
      ],
    );
  }
}
