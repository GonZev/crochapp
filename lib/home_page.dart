import 'package:crochapp/services/sqlite_service.dart';
import 'package:crochapp/ui/counter_page.dart';
import 'package:crochapp/ui/patterns_page.dart';
import 'package:crochapp/ui/project_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //All data
  List<Map<String, dynamic>> myData = [];
  bool _isLoading = true;
  //this function is used to fetch all data from the database
  void _refreshData() async {
    final data = await SqliteService.getAllPatterns();
    setState(() {
      myData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshData();
  }

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
            ]));
  }
}