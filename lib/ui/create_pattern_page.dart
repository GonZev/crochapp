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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'New Pattern',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 36,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.start,
                ),
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
              ),
              const TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: 'R1. ...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    elevation: 10.0,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(4)),
                child: Text(
                  'ADD',
                  style:
                      GoogleFonts.bebasNeue(fontSize: 22, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Opacity(
                      opacity: 0.8,
                      child: TextField(
                        readOnly: false,
                        decoration: InputDecoration(
                          hintText: 'text patterns ... ',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                                style: BorderStyle.solid),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.all(4)),
                            child: Text(
                              'EDIT',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 22, color: Colors.white),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                elevation: 10.0,
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.all(8)),
                            child: Text(
                              'ADD IMAGE',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
