import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/constants/colors.dart';
import 'package:octoconta_final/src/models/pagina_principal/modal_bottom.dart';

class OctoFloatingButton extends StatelessWidget {
  const OctoFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
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
            fontSize: 16.sp,
          ),
          labelBackgroundColor: colorError,
          backgroundColor: colorError,
          onTap: () => showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.sp),
              ),
            ),
            backgroundColor: fondoColor,
            builder: (_) => OctoModal(
              contenidoDelModal: Container(),
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
          labelStyle: GoogleFonts.inter(
            color: fondoColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
          labelBackgroundColor: Colors.green,
          backgroundColor: Colors.green,
          onTap: () => showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.sp),
              ),
            ),
            backgroundColor: fondoColor,
            builder: (_) => OctoModal(
              contenidoDelModal: Container(),
            ),
          ),
        ),
      ],
      activeChild: Icon(
        Icons.keyboard_return,
        color: Theme.of(context).scaffoldBackgroundColor,
        size: 30.sp,
      ),
      spaceBetweenChildren: 10,
      child: Icon(
        Icons.edit,
        color: Theme.of(context).scaffoldBackgroundColor,
        size: 30.sp,
      ),
    );
  }
}
