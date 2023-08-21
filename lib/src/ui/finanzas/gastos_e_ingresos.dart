import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/constants/colors.dart';

// import 'package:octoconta_final//';

// import 'package:octoconta_final/src/ui/settings_screens/settings_screen.dart';

class GastosEIngresos extends StatelessWidget {
  const GastosEIngresos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Ingresos',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: primario,
                ),
                subtitle: Text('Ver mis ingresos'),
                onTap: () {},
              ),
              GastosCategorias(),
            ],
          ),
        ),
      ),
    );
  }
}

class GastosCategorias extends StatelessWidget {
  const GastosCategorias({super.key});

  static const categorias = {'Comida': '../../images/categorias/alimentos.png'};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Gastos',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        // GridView.builder(
        //     gridDelegate:
        //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //     itemBuilder: itemBuilder),
      ],
    );
  }
}
