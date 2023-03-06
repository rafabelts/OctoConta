import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/bitacora_botones.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';
import 'package:octoconta_final/src/models/ingreso_item.dart';
import 'package:octoconta_final/src/models/mensaje_cuentas.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/agregar_ingreso/agregar_ingreso_inputs.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/informacion_ingreso.dart';
import 'package:provider/provider.dart';

class IngresosInputs extends StatefulWidget {
  const IngresosInputs({super.key});

  @override
  State<IngresosInputs> createState() => _IngresosInputsState();
}

class _IngresosInputsState extends State<IngresosInputs> {
  TextEditingController ingreso = TextEditingController();
  TextEditingController montoIngreso = TextEditingController();

  String mensajeDeErrorIngreso = '';
  bool errorInIngreso = false;
  mensajeErrorIngreso(String mensajeError, bool error) {
    setState(() {
      errorInIngreso = error;
      errorInIngreso == false ? false : (mensajeDeErrorIngreso = mensajeError);
    });
  }

  String mensajeDeErrorMontoIngreso = '';
  bool errorInMontoIngreso = false;
  mensajeErrorMontoIngreso(String mensajeError, bool error) {
    setState(() {
      errorInMontoIngreso = error;
      errorInMontoIngreso == false
          ? false
          : (mensajeDeErrorMontoIngreso = mensajeError);
    });
  }

  onChangedIngreso() => mensajeErrorIngreso('', false);
  oncChangedMontoIngreso() => mensajeErrorMontoIngreso('', false);

  double montoIngresoDouble = 0.0;

  @override
  void initState() {
    super.initState();
    ingreso;
    montoIngreso;
  }

  @override
  void dispose() {
    super.dispose();
    ingreso.dispose();
    montoIngreso.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void agregarIngreso() {
      if (ingreso.text.isEmpty) {
        mensajeErrorIngreso('Por favor, ingrese el nombre del ingreso.', true);
      } else if (montoIngreso.text.isEmpty) {
        mensajeErrorMontoIngreso(
            'Por favor, ingrese la cantidad del ingreso.', true);
      } else {
        mensajeErrorIngreso('', false);
        mensajeErrorMontoIngreso('', false);

        try {
          setState(() {
            montoIngresoDouble =
                double.parse(montoIngreso.text.replaceAll(',', ''));
          });
          IngresoItem nuevoIngreso =
              IngresoItem(ingreso: ingreso.text, monto: montoIngresoDouble);
          Provider.of<InformacionIngresos>(context, listen: false)
              .addNuevoIngreso(nuevoIngreso);
          Navigator.pop(context);
        } catch (e) {
          showMensajeParaUsuario(
              context, true, 'Error. Por favor ingresa valores válidos');
        }
      }
    }

    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              AgregarIngresoInputs(
                ingreso: ingreso,
                onChangedIngreso: (value) => onChangedIngreso(),
                errorInIngreso:
                    errorInIngreso == false ? null : mensajeDeErrorIngreso,
                montoIngreso: montoIngreso,
                onChangedMontoIngreso: (value) => oncChangedMontoIngreso(),
                errorInMontoIngreso: errorInMontoIngreso == false
                    ? null
                    : mensajeDeErrorMontoIngreso,
              ),
              BotonesBitacora(
                agregar: "Agregar",
                cancelar: "Cancelar",
                agregarOpcion: () => agregarIngreso(),
                cancelarOpcion: () => Navigator.pop(context),
              ),
            ],
          ),
        ));
  }
}
