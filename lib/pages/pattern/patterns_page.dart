import 'package:crochapp/pages/pattern/create_pattern_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/pattern_hive_functions.dart';

myItem(String namePattern) {
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
    child: Text(namePattern),
  );
}

class PatternsPage extends StatefulWidget {
  const PatternsPage({super.key});

  @override
  State<PatternsPage> createState() => _PatternsPageState();
}

class _PatternsPageState extends State<PatternsPage> {
  List myHiveData = [];
  getHiveData() {
    myHiveData = PatternHiveFunctions.getAllPatterns();
    print(":::LOADING PATTERNS:::");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getHiveData();
  }

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
              builder: (context) => const CreatePatternPage(),
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
        child: myHiveData.isEmpty
            ? Center(
                child: Text(
                'No patterns',
                style: GoogleFonts.bebasNeue(fontSize: 40, color: Colors.grey),
              ))
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    children: List.generate(myHiveData.length, (index) {
                  final userData = myHiveData[index];
                  print(userData);
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        "${userData["name"]}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                            fontSize: 30, color: Colors.green),
                      ),
                    ),
                  );
                }).toList()),
              ),
      ),
    );
  }
}
