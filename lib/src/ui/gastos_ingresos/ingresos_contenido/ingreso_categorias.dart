import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../services/informacion_bitacora.dart';

class CategoriaIngresos extends StatefulWidget {
  const CategoriaIngresos({super.key});

  @override
  State<CategoriaIngresos> createState() => _CategoriaIngresosState();
}

class _CategoriaIngresosState extends State<CategoriaIngresos> {
  @override
  void initState() {
    super.initState();

    Provider.of<InformacionBitacora>(context, listen: false)
        .prepararDatosIngresos();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<InformacionBitacora>(
          builder: (context, value, child) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: value.obtenerListaIngresos().length,
                itemBuilder: (context, index) {
                  return Center(
                      child: ListTile(
                    title: Text(
                      value.obtenerListaIngresos()[index].ingreso,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    trailing: Text(
                      '\$${NumberFormat('#,###.##').format(value.obtenerListaIngresos()[index].monto)}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ));
                },
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 80.h),
          child: Text(
            'Rafa, este es su total de ingresos del mes:',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 40.h),
          child: Text(
            '\$${NumberFormat('#,##0.00').format(Provider.of<InformacionBitacora>(context, listen: true).prepararTotalIngresos())}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ), // Text('\$${NumberFormat('#,##0.#0').format(1000))}',))
      ],
    );
  }
}
