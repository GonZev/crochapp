import 'package:crochapp/pages/counter_page.dart';
import 'package:crochapp/pages/patterns_page.dart';
import 'package:crochapp/pages/project_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;

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
          backgroundColor: const Color.fromRGBO(
              14, 55, 199, 1) /*const Color.fromRGBO(44, 71, 169, 1)*/,
          elevation: 30,
        ),
        backgroundColor: const Color.fromRGBO(233, 238, 255, 1),
        body: const [
          PatternsPage(),
          ProjectPage(),
          CounterPage()
        ][selectedPageIndex],
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                selectedPageIndex = index;
              });
            },
            selectedIndex: 0,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                label: 'My patterns',
                selectedIcon: Icon(Icons.book),
                icon: Icon(Icons.bookmark_border),
              ),
              NavigationDestination(
                label: 'My projects',
                selectedIcon: Icon(Icons.favorite),
                icon: Icon(Icons.favorite_border),
              ),
              NavigationDestination(
                label: 'Counter',
                selectedIcon: Icon(Icons.timer),
                icon: Icon(Icons.timer_outlined),
              ),
            ]));
  }
}

/*class BottomNavigationBarCustom extends StatelessWidget {
  const BottomNavigationBarCustom({super.key, required index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 30,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            activeIcon: Icon(Icons.book_outlined),
            label: 'My patterns',
            
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            activeIcon: Icon(Icons.favorite_border_rounded),
            label: 'My projects',
            ),
        BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_rounded),
            activeIcon: Icon(Icons.watch_later_outlined),
            label: 'Counter'),
      ],
    );


  }
}*/


