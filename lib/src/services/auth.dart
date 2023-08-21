import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser; // Checa el usuario

  Stream<User?> get authStateChanges =>
      _firebaseAuth.authStateChanges(); // Toma los cambios en el auth

  Future<void> iniciarSesion(
      {required String email,
      required String password,
      required BuildContext context,
      snapshot}) async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: const Color.fromARGB(255, 153, 151, 158),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  Future<void> crearUsuario(
      {required String email,
      required String password,
      required BuildContext context,
      snapshot}) async {
    showDialog(
      context: context,
      builder: (conext) => Center(
        child: CircularProgressIndicator(
          color: const Color.fromARGB(255, 153, 151, 158),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  Future<void> cierreSesion(
      {required BuildContext context,
      required navegacionPantallasAlCerrarSesion}) async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: const Color.fromARGB(255, 153, 151, 158),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
    await _firebaseAuth.signOut().then(navegacionPantallasAlCerrarSesion);
  }

  Future<void> enviarCorreoCambioContra(
      {required BuildContext context, required email}) async {
    await _firebaseAuth
        .sendPasswordResetEmail(email: email)
        .then((value) => Navigator.pop(context));
  }
}
