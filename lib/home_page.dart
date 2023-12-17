import 'package:crochapp/pages/counter_page.dart';
import 'package:crochapp/pages/pattern/patterns_page.dart';
import 'package:crochapp/pages/project/project_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 1;

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
          backgroundColor: const Color.fromRGBO(14, 55, 199, 1),
          elevation: 30),
      backgroundColor: const Color.fromRGBO(233, 238, 255, 1),
      body: const [
        PatternsPage(),
        ProjectPage(),
        CounterPage()
      ][selectedPageIndex],
      bottomNavigationBar: NavigationBar(
        elevation: BorderSide.strokeAlignOutside,
        indicatorColor: const Color.fromRGBO(14, 55, 199, 0.1),
        shadowColor: Colors.grey,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        selectedIndex: selectedPageIndex,
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
        ],
      ),
    );
  }
}
