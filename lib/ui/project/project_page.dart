import 'package:crochapp/ui/project/create_project_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pattern/patterns_page.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        tooltip: "Add new pattern",
        elevation: 3.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateProjectPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add_circle_rounded,
          size: 50,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            Text(
              'PATTERNS',
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
