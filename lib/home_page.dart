import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CROCHAPP"),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 20,
      ),
      backgroundColor: Colors.blue,
      body: Row(
        children: [
          Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 128, 207, 243),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(
                "My proyects",
                style: GoogleFonts.bebasNeue(),
              )),
          Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 128, 207, 243),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(
                "My patterns",
                style: GoogleFonts.bebasNeue(),
              )),
          Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 128, 207, 243),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(
                "Counter",
                style: GoogleFonts.bebasNeue(),
              ))
        ],
      ),
    );
  }
}
