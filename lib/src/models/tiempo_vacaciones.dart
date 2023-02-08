import 'package:flutter/material.dart';

String calcularTiempo(
    TextEditingController yearUsuario, String diasVacaciones) {
  DateTime today = DateTime.now();
  int actualYear = today.year;
  int arriveYear = int.parse(yearUsuario.text);

  int tiempo = actualYear - arriveYear;

  if (tiempo == 1) {
    return diasVacaciones = '12';
  } else if (tiempo == 2) {
    return diasVacaciones = '14';
  } else if (tiempo == 3) {
    return diasVacaciones = '16';
  } else if (tiempo == 4) {
    return diasVacaciones = '18';
  } else if (tiempo == 5) {
    return diasVacaciones = '20';
  } else if (tiempo >= 6 && tiempo <= 10) {
    return diasVacaciones = '22';
  } else if (tiempo >= 11 && tiempo <= 15) {
    return diasVacaciones = '24';
  } else if (tiempo >= 16 && tiempo <= 20) {
    return diasVacaciones = '26';
  } else if (tiempo >= 21 && tiempo <= 25) {
    return diasVacaciones = '28';
  } else if (tiempo >= 26 && tiempo <= 30) {
    return diasVacaciones = '30';
  } else if (tiempo >= 31 && tiempo <= 35) {
    return diasVacaciones = '32';
  } else {
    return diasVacaciones = '0';
  }
}
