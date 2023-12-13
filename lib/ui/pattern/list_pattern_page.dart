import 'package:crochapp/ui/pattern/patterns_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPatternsPage extends StatefulWidget {
  const ListPatternsPage({super.key});

  @override
  State<ListPatternsPage> createState() => _ListPatternsPageState();
}

class _ListPatternsPageState extends State<ListPatternsPage> {
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
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            Text(
              'ALL PATTERNS',
              style: GoogleFonts.bebasNeue(fontSize: 40),
            ),
            myItem(),
            myItem(),
            myItem(),
            myItem(),
            myItem(),
            myItem(),
            myItem(),
            myItem(),
            myItem(),
            myItem(),
            myItem(),
          ],
        ),
      ),
    );
  }
}

