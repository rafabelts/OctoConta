import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/services/informacion_bitacora.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../models/pagina_principal/bitacora_gastos/categorias/categoria_screen.dart';
import '../../../models/pagina_principal/bitacora_gastos/categorias/categorias_items.dart';

class CategoriaGastos extends StatefulWidget {
  const CategoriaGastos({super.key});

  @override
  State<CategoriaGastos> createState() => _CategoriaGastosState();
}

class _CategoriaGastosState extends State<CategoriaGastos> {
  List<dynamic> categorias = [
    [
      'Alimentos',
      ScreenCategoria(
        titulo: 'Alimentos',
        contenido: ItemsCategoria(
          suma: Consumer<InformacionBitacora>(
            builder: (context, value, child) => Text(
              '\$${NumberFormat('#,##0.00').format(value.prepararTotalGastos()[1])}',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ),
          categoria: 'alimentos',
          consumidorProvider: Consumer<InformacionBitacora>(
            builder: (context, value, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: value.obtenerListaAlimentos().length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: ListTile(
                      leading: Text(
                        '${value.obtenerListaAlimentos()[index].cantidad}X',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      title: Text(
                        value.obtenerListaAlimentos()[index].articulo,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      trailing: Text(
                        '\$${NumberFormat('#,###.##').format(value.obtenerListaAlimentos()[index].precio)}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ));
                  },
                ),
              );
            },
          ),
        ),
      )
    ],
    [
      'Salud e Higiene',
      ScreenCategoria(
        titulo: 'Salud e Higiene',
        contenido: ItemsCategoria(
          suma: Consumer<InformacionBitacora>(
            builder: (context, value, child) => Text(
              '\$${NumberFormat('#,##0.00').format(value.prepararTotalGastos()[2])}',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ),
          categoria: 'salud e higiene',
          consumidorProvider: Consumer<InformacionBitacora>(
            builder: (context, value, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: value.obtenerListaSalud().length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: ListTile(
                      leading: Text(
                        '${value.obtenerListaSalud()[index].cantidad}X',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      title: Text(
                        value.obtenerListaSalud()[index].articulo,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      trailing: Text(
                        '\$${NumberFormat('#,###.##').format(value.obtenerListaSalud()[index].precio)}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ));
                  },
                ),
              );
            },
          ),
        ),
      )
    ],
    [
      'Servicios',
      ScreenCategoria(
        titulo: 'Servicios',
        contenido: ItemsCategoria(
          suma: Consumer<InformacionBitacora>(
            builder: (context, value, child) => Text(
              '\$${NumberFormat('#,##0.00').format(value.prepararTotalGastos()[3])}',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ),
          categoria: 'servicios',
          consumidorProvider: Consumer<InformacionBitacora>(
            builder: (context, value, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: value.obtenerListaServicios().length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: ListTile(
                      leading: Text(
                        '${value.obtenerListaServicios()[index].cantidad}X',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      title: Text(
                        value.obtenerListaServicios()[index].articulo,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      trailing: Text(
                        '\$${NumberFormat('#,###.##').format(value.obtenerListaServicios()[index].precio)}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ));
                  },
                ),
              );
            },
          ),
        ),
      )
    ],
    [
      'Suscripciones',
      ScreenCategoria(
        titulo: 'Suscripciones',
        contenido: ItemsCategoria(
          categoria: 'suscripciones',
          suma: Consumer<InformacionBitacora>(
            builder: (context, value, child) => Text(
              '\$${NumberFormat('#,##0.00').format(value.prepararTotalGastos()[4])}',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ),
          consumidorProvider: Consumer<InformacionBitacora>(
            builder: (context, value, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: value.obtenerListaSuscripciones().length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: ListTile(
                      leading: Text(
                        '${value.obtenerListaSuscripciones()[index].cantidad}X',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      title: Text(
                        value.obtenerListaSuscripciones()[index].articulo,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      trailing: Text(
                        '\$${NumberFormat('#,###.##').format(value.obtenerListaSuscripciones()[index].precio)}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ));
                  },
                ),
              );
            },
          ),
        ),
      )
    ],
    [
      'Otros',
      ScreenCategoria(
        titulo: 'Otros',
        contenido: ItemsCategoria(
          suma: Consumer<InformacionBitacora>(
            builder: (context, value, child) => Text(
              '\$${NumberFormat('#,##0.00').format(value.prepararTotalGastos()[5])}',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ),
          categoria: 'otros',
          consumidorProvider: Consumer<InformacionBitacora>(
            builder: (context, value, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: value.obtenerListaOtros().length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: ListTile(
                      leading: Text(
                        '${value.obtenerListaOtros()[index].cantidad}X',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      title: Text(
                        value.obtenerListaOtros()[index].articulo,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      trailing: Text(
                        '\$${NumberFormat('#,###.##').format(value.obtenerListaOtros()[index].precio)}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ));
                  },
                ),
              );
            },
          ),
        ),
      )
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: categorias.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: ListTile(
                splashColor: const Color.fromARGB(32, 115, 79, 223),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => categorias[index][1])),
                title: Text(
                  categorias[index][0],
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: botonSecundarioColor),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 80.h),
          child: Text(
            'Rafa, este mes ha gastado:',
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 40.h),
          child: Text(
            '\$${NumberFormat('#,##0.00').format(Provider.of<InformacionBitacora>(context, listen: true).prepararTotalGastos()[0])}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ), // Text('\$${NumberFormat('#,##0.#0').format(1000))}',))
      ],
    );
  }
}
