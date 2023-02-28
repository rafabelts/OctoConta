import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemsIngreso extends StatelessWidget {
  final List<dynamic> items;
  const ItemsIngreso({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: ListTile(
              splashColor: const Color.fromARGB(32, 115, 79, 223),
              title: Text(
                items[index][0],
                style: GoogleFonts.inter(
                  color: const Color(0xFF2a195d),
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              trailing: Text(
                '\$${items[index][1]}',
                style: GoogleFonts.inter(
                  color: const Color(0xFF2a195d),
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
