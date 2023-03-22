import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/bitacora_gastos/agregar_ingreso/agregar_ingreso.dart';
import 'package:octoconta_final/src/bitacora_gastos/agregar_ingreso/contenido_modal_agregar_ingreso.dart';
import 'package:octoconta_final/src/ui/gastos_ingresos/ingresos_contenido/ingreso_categorias.dart';
import 'package:provider/provider.dart';

import '../../bitacora_gastos/agregar_articulo/contenido_modal_agregar_articulo.dart';
import '../../services/informacion_bitacora.dart';
import '../../constants/colors.dart';
import '../../models/app_bar.dart';
import '../../models/pagina_principal/bitacora_gastos/botones_categorias/botones_categorias.dart';
import '../../models/pagina_principal/bitacora_gastos/botones_navegacion_bitacora.dart';
import '../../models/pagina_principal/bitacora_gastos/categorias/categorias.dart';
import '../../models/pagina_principal/bitacora_gastos/entradas_bitacora/botones_bitacora.dart';
import '../../models/pagina_principal/bitacora_gastos/entradas_bitacora/entradas_bitacora.dart';
import '../../models/pagina_principal/bitacora_gastos/tarjeta_info_saldo.dart';
import '../../models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';
import '../../models/pagina_principal/calculos_contables/periodos_pago.dart';
import '../../models/pagina_principal/modal_bottom.dart';
import 'agregar_saldo/agregar_saldo_screen.dart';
import 'gastos_contenido/gastos_categorias.dart';

/*
  Creo la pantalla en la cual el usuario podra editar su saldo, agregar/revisar gastos o ingresos.
*/

class GastosEIngresosScreen extends StatefulWidget {
  const GastosEIngresosScreen({super.key});

  @override
  State<GastosEIngresosScreen> createState() => _GastosEIngresosScreenState();
}

class _GastosEIngresosScreenState extends State<GastosEIngresosScreen> {
  navegarAEdicionSaldo() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CategoriasFinanzas(
            titulo: 'Agregar Saldo',
            contenido: AgregarSaldoScreen(),
          ),
        ),
      );

  navegarAGastos() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CategoriasFinanzas(
            titulo: 'Gastos',
            contenido: CategoriaGastos(),
          ),
        ),
      );
  navegarAIngresos() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CategoriasFinanzas(
            titulo: 'Ingresos',
            contenido: CategoriaIngresos(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    double gastoUsuario =
        Provider.of<InformacionBitacora>(context, listen: true)
            .prepararTotalGastos()[0];
    double ingresoUsuario =
        Provider.of<InformacionBitacora>(context, listen: true)
            .prepararTotalIngresos();

    return Scaffold(
      appBar: OctoAppBar(
        titulo: 'Finanzas',
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
          controller:
              ScrollController(keepScrollOffset: true, initialScrollOffset: 0),
          padding:
              EdgeInsets.only(top: 5.h, bottom: 80.h, left: 10.w, right: 10.w),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              BotonNavegacionBitacora(
                onTap: navegarAEdicionSaldo,
                pantallaAIr: 'Agregar Saldo',
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.w),
                child: TarjetaInfoSaldo(
                  opcion: 'Gastos',
                  total: gastoUsuario,
                ),
              ),
              BotonNavegacionBitacora(
                onTap: navegarAGastos,
                pantallaAIr: 'Revisar gastos',
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.w),
                child: TarjetaInfoSaldo(
                  opcion: 'Ingresos',
                  total: ingresoUsuario,
                ),
              ),
              BotonNavegacionBitacora(
                onTap: navegarAIngresos,
                pantallaAIr: 'Revisar ingresos',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: botonPrimarioColor,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.remove,
              color: Theme.of(context).scaffoldBackgroundColor,
              size: 18.sp,
            ),
            label: 'Agregar gasto.',
            labelStyle: GoogleFonts.inter(
              color: fondoColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
            labelBackgroundColor: colorError,
            backgroundColor: colorError,
            onTap: () => showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0.r),
                      topRight: Radius.circular(40.0.r))),
              backgroundColor: fondoColor,
              builder: (_) => const OctoModal(
                contenidoDelModal: ContenidoModalAgregarGasto(),
              ),
            ),
          ),
          SpeedDialChild(
            child: Icon(
              Icons.add,
              color: Theme.of(context).scaffoldBackgroundColor,
              size: 18.sp,
            ),
            label: 'Agregar ingreso.',
            labelBackgroundColor: Colors.green,
            labelStyle: GoogleFonts.inter(
              color: fondoColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
            backgroundColor: Colors.green,
            onTap: () => showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0.r),
                      topRight: Radius.circular(40.0.r))),
              backgroundColor: fondoColor,
              builder: (_) => const OctoModal(
                contenidoDelModal: ContenidoModalAgregarIngreso(),
              ),
            ),
          ),
        ],
        activeChild: Icon(
          Icons.keyboard_return,
          color: Theme.of(context).scaffoldBackgroundColor,
          size: 30.sp,
        ),
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spaceBetweenChildren: 12,
        buttonSize: Size(70.w, 70.h),
        child: Icon(
          Icons.add,
          color: Theme.of(context).scaffoldBackgroundColor,
          size: 30.sp,
        ),
      ),
    );
  }
}
