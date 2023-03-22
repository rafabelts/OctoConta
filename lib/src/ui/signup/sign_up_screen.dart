import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/ui/verificacion_correo/verificacion_correo_screen.dart';

import '../../constants/colors.dart';
import '../../autentificacion/crear_cuenta.dart';
import '../../models/app_bar.dart';
import '../../models/entradas_autentificacion/botones/botones_creacion_cuenta.dart';
import '../../models/entradas_autentificacion/entradas_contrasena.dart';
import '../../models/entradas_autentificacion/entradas_correo_nombre.dart';

/* 
  Creacion de la pantalla de la creacion de cuenta, en la cual
  se muestran las entradas de textos y los botones para pasar
  a la pantalla principal una vez que la cuenta haya sido creada.
*/

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nombre = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController contrasena = TextEditingController();
  TextEditingController confirmarcontrasena = TextEditingController();

  @override
  void dispose() {
    nombre.dispose();
    correo.dispose();
    contrasena.dispose();
    confirmarcontrasena.dispose();
    super.dispose();
  }

  bool hayNombre = true;
  String nombreError = '';

  void validarNombre(bool valido, String error) {
    setState(() {
      hayNombre = valido;
      nombreError = error;
    });
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
  String contraError = '';

  void validarContrasena(bool valido, String error) {
    setState(() {
      hayContrasena = valido;
      contraError = error;
    });
  }

  bool hayConfirmaContra = true;
  String confirmarContraError = '';

  void validarConfirmaContra(bool valido, String error) {
    setState(() {
      hayConfirmaContra = valido;
      confirmarContraError = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    CreacionCuenta crearCuenta = CreacionCuenta(
      contexto: context,
      nombre: nombre,
      validarNombre: validarNombre,
      correo: correo,
      validarCorreo: validarCorreo,
      contrasena: contrasena,
      validarContrasena: validarContrasena,
      confirmaContra: confirmarcontrasena,
      validarConfirmaContra: validarConfirmaContra,
    );
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
                'Crear cuenta',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.justify,
              ),
              EntradaCorreoNombre(
                controlador: nombre,
                onChanged: (value) => crearCuenta.onChanged(),
                onComplete: crearCuenta.onCompleteNombre,
                hayValor: hayNombre,
                error: hayNombre == true ? null : nombreError,
                icono: Icons.person_outline_rounded,
                etiqueta: 'Nombre',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: EntradaCorreoNombre(
                  controlador: correo,
                  onChanged: (value) => crearCuenta.onChanged(),
                  onComplete: crearCuenta.onCompleteCorreo,
                  hayValor: hayCorreo,
                  error: hayCorreo == true ? null : correoError,
                  icono: Icons.mail_outline_rounded,
                  etiqueta: 'Correo electrónico',
                ),
              ),
              EntradaContrasena(
                controlador: contrasena,
                onChanged: (value) => crearCuenta.onChanged(),
                onComplete: crearCuenta.onCompleteContra,
                hayValor: hayContrasena,
                error: hayContrasena == true ? null : contraError,
                etiqueta: 'Contraseña',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: EntradaContrasena(
                  controlador: confirmarcontrasena,
                  onChanged: (value) => crearCuenta.onChanged(),
                  onComplete: crearCuenta.onCompleteConfContra,
                  hayValor: hayConfirmaContra,
                  error:
                      hayConfirmaContra == true ? null : confirmarContraError,
                  etiqueta: 'Confirmar contraseña',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: SignUpButtons(
                  crearCuenta: crearCuenta.crear,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
