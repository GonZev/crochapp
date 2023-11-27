import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePatternPage extends StatelessWidget {
  const CreatePatternPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, grade: 0.5),
        toolbarHeight: 54.0,
        title: Text(
          "CROCHAPP",
          style: GoogleFonts.bebasNeue(
              fontSize: 24, color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
        backgroundColor: const Color.fromRGBO(14, 55, 199, 1),
        elevation: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                'New Pattern',
                style: GoogleFonts.bebasNeue(
                  fontSize: 36,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.start,
              ),
              const TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    hintText: 'Name pattern',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 1.0,
                            style: BorderStyle.solid))),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Round',
                  style: GoogleFonts.bebasNeue(fontSize: 28),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
