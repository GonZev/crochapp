import 'package:crochapp/ui/create_pattern_page.dart';
import 'package:flutter/material.dart';

myItem() {
  return Container(
    width: 10,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 0),
          blurRadius: 4.0,
        )
      ],
      color: Color.fromRGBO(255, 255, 255, 1.0),
    ),
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
    alignment: Alignment.center,
    height: 100,
    child: const Text('NAME PATTERN'),
  );
}

class PatternsPage extends StatelessWidget {
  const PatternsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Center(child: Text('PATTERNS'));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        tooltip: "Add new pattern",
        elevation: 3.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePatternPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add_circle_rounded,
          size: 50,
        ),
      ),
      body: ListView(
        children: [
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
    );
  }
}
