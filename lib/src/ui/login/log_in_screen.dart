import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/autentificacion/iniciar_sesion.dart';
import 'package:octoconta_final/src/ui/olvido_contrasena/olvido_contrasena_screen.dart';
import '../../models/app_bar.dart';
import '../../models/entradas_autentificacion/botones/botones_inicio_sesion.dart';
import '../../models/entradas_autentificacion/entradas_contrasena.dart';
import '../../models/entradas_autentificacion/entradas_correo_nombre.dart';

/* 
  Creacion de la pantalla del inicio de sesion, en la cual
  se muestran las entradas de textos y los botones para pasar
  a la pantalla principal una vez que la sesion haya sido iniciada.
*/

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasena = TextEditingController();

  @override
  void dispose() {
    correo.dispose();
    contrasena.dispose();
    super.dispose();
  }

  bool hayCorreo = true;
  String correoError = '';

  void validarCorreo(bool valido, String error) {
    setState(() {
      hayCorreo = valido;
      correoError = error;
    });
  }

  bool hayContrasena = true;
  String contrasenaError = '';

  void validarContrasena(bool valido, String error) {
    setState(() {
      hayContrasena = valido;
      contrasenaError = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    IniciarSesion inicioSesion = IniciarSesion(
        contexto: context,
        correo: correo,
        validarCorreo: validarCorreo,
        contrasena: contrasena,
        validarContrasena: validarContrasena);
    return Scaffold(
      appBar: OctoAppBar(
        titulo: '',
        iconoPrincipal: IconButton(
          splashRadius: 1.0,
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 26.sp),
        ),
        iconoSecundario: const Icon(null),
        onPressed: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              right: 15.0.w, left: 15.0.w, bottom: 15.0.h, top: 5.0.h),
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Bienvenido!',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.justify,
              ),
              EntradaCorreoNombre(
                controlador: correo,
                onChanged: (value) => inicioSesion.onChanged(),
                onComplete: inicioSesion.onCompleteCorreo,
                hayValor: hayCorreo,
                error: hayCorreo == true ? null : correoError,
                icono: Icons.mail_outline_rounded,
                etiqueta: 'Correo electrónico',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: EntradaContrasena(
                  controlador: contrasena,
                  onChanged: (value) => inicioSesion.onChanged(),
                  onComplete: inicioSesion.onCompleteContra,
                  hayValor: hayContrasena,
                  error: hayContrasena == true ? null : contrasenaError,
                  etiqueta: 'Contraseña',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: LogInButtons(
                  iniciarSesion: inicioSesion.iniciarSesionUsuario,
                ),
              ), //Botones de inicio de sesion y olvido de contraseña
            ],
          ),
        ),
      ),
    );
  }
}
