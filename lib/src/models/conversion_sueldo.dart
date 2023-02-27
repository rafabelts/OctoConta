double convertirSueldo(String sueldo, String periodoSalario) {
  double salario = double.parse(sueldo);
  if (periodoSalario == 'Anual') {
    return double.parse('${salario / 360}');
  } else if (periodoSalario == 'Mensual') {
    return double.parse('${salario / 30}');
  } else if (periodoSalario == 'Semanal') {
    return double.parse('${salario / 7}');
  } else {
    return salario;
  }
}
