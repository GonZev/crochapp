import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 54.0,
        title: Text(
          "CROCHAPP",
          style: GoogleFonts.bebasNeue(
              fontSize: 32, color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
        backgroundColor: const Color.fromRGBO(44, 71, 169, 1),
        elevation: 30,
      ),
      backgroundColor: const Color.fromRGBO(233, 238, 255, 1),
      bottomNavigationBar: const BottomNavigationBarCustom(),
    );
  }
}

class BottomNavigationBarCustom extends StatelessWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 30,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            activeIcon: Icon(Icons.book_outlined),
            label: 'My patterns'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            activeIcon: Icon(Icons.favorite_border_rounded),
            label: 'My projects'),
        BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_rounded),
            activeIcon: Icon(Icons.watch_later_outlined),
            label: 'Counter'),
      ],
    );
  }
}
