import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CambiarEmailButton extends StatelessWidget {
  const CambiarEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => buildCambiarEmailScreen(context)));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Text>[
              Text(
                'Correo electrónico:',
                style: GoogleFonts.poppins(
                  color: const Color(0xff4527A0),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'rafabeltrans17@gmail.com',
                style: GoogleFonts.poppins(
                  color: const Color(0xff4527A0),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 39.8),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff4527A0),
                size: 15,
              ))
        ],
      ),
    );
  }
}

Widget buildCambiarEmailScreen(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
              columnSpan: 12,
              child: buildContent(context),
            ),
          ],
        ),
      ));
}

Widget buildContent(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          'Cambiar Correo',
          style: GoogleFonts.inter(
            color: const Color(0xff2A195D),
            fontWeight: FontWeight.w700,
            fontSize: 37.9,
          ),
        ),
      ),
      TextField(
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Nuevo Correo Electrónico')),
          labelStyle: GoogleFonts.inter(
              textStyle: const TextStyle(color: Color(0xff534677)),
              fontSize: 21,
              fontWeight: FontWeight.w500),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Color(0xff534677))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Color(0xff534677))),
          prefixIcon: const Icon(
            Icons.mail_outline_rounded,
            color: Color(0xff534677),
            size: 30,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: const Color(0xff4527A0),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
            ),
            child: Text(
              'Cambiar',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
