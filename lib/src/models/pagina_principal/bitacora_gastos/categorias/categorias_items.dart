import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/services/informacion_bitacora.dart';
import 'package:provider/provider.dart';

class ItemsCategoria extends StatefulWidget {
  final String categoria;
  final Consumer? consumidorProvider;
  final Consumer? suma;
  const ItemsCategoria(
      {this.consumidorProvider, this.suma, required this.categoria, super.key});

  @override
  State<ItemsCategoria> createState() => _ItemsCategoriaState();
}

class _ItemsCategoriaState extends State<ItemsCategoria> {
  // @override
  // void initState() {
  //   Provider
  //   super.initState();
  // }
  @override
  void initState() {
    // prepara datos
    super.initState();
    Provider.of<InformacionBitacora>(context, listen: false)
        .prepararDatosGastos();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: widget.consumidorProvider,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: Text(
              'En ${widget.categoria} ha gastado:',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 40.h),
            child: widget.suma,
          ),
        ),
      ],
    );
  }
}
