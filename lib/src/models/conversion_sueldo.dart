import 'package:flutter/material.dart';

double convertirSueldo(
    TextEditingController sueldo, String periodoSalario, double conversion) {
  double salario = double.parse(sueldo.text);
  // var salario = doubl,parse(sueldo.text);
  if (periodoSalario == 'Anual') {
    return conversion = double.parse('${salario / 1}');
  } else if (periodoSalario == 'Mensual') {
    return conversion = double.parse('${salario / 30}');
  } else if (periodoSalario == 'Semanal') {
    return conversion = double.parse('${salario / 7}');
  } else {
    return conversion = salario;
  }
}
