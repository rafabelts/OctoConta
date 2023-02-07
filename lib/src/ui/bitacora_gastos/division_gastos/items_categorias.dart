import 'package:flutter/material.dart';

class ItemsCategorias extends StatelessWidget {
  const ItemsCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          onTap: () {},
          title: Text('Alimentos'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          onTap: () {},
          title: Text('Salud e Higiene'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          onTap: () {},
          title: Text('Servicios'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          onTap: () {},
          title: Text('Suscripciones'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          onTap: () {},
          title: Text('Otros'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
