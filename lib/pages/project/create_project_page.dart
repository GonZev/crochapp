import 'package:crochapp/controller/project_hive_functions.dart';
import 'package:crochapp/pages/pattern/create_pattern_page.dart';
import 'package:crochapp/pages/pattern/list_pattern_page.dart';
import 'package:crochapp/pages/widgets/modal_message.dart';
import 'package:crochapp/singleton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/pattern_model.dart';

void createProject(String nameProject, PatternModel pattern) {
  ProjectHiveFunctions.createProject({
    "name": nameProject,
    "pattern": pattern,
  });
}

writeRound(
    TextEditingController valueRound, TextEditingController valuePattern) {
  //I can save the rounds at a list ???

  if (valueRound.text.isNotEmpty) {
    if (valuePattern.text.isEmpty) {
      valuePattern.text = valueRound.text.toString();
    } else {
      valuePattern.text =
          '${valuePattern.text.toString()}\n${valueRound.text.toString()}';
    }
  }

  return valuePattern.text.toString();
}

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  //controllers of fields
  final nameTextFieldController = TextEditingController();
  final addRoundTextFieldController = TextEditingController();
  final patternTextFieldController = TextEditingController();

  var pattern = PatternModel.empty();

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
                  'New Project',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 36,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // NOTE: FIELD NAME PROJECT
              TextField(
                controller: nameTextFieldController,
                textAlign: TextAlign.start,
                decoration: const InputDecoration(
                  hintText: 'Name project',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: Singleton().pattern.name.isEmpty,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose',
                    style: GoogleFonts.bebasNeue(fontSize: 28),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Visibility(
                visible: Singleton().pattern.name.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text('Pattern:'),
                      Text(Singleton().pattern.name.toString()),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Visibility(
                visible: Singleton().pattern.name.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //NOTE: BUTTON SELECT PATTERN
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListPatternsPage(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.all(8)),
                        child: Text(
                          'SELECT PATTERN',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 22, color: Colors.white),
                        ),
                      ),

                      //NOTE: BUTTON WRITE PATTERN
                      OutlinedButton(
                        onPressed: () {
                          Singleton().backto = true;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreatePatternPage(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                            backgroundColor: Colors.yellow,
                            padding: const EdgeInsets.all(8)),
                        child: Text(
                          'WRITE PATTERN',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 22, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                );
              }),

              // NOTE: BTN CREATE
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {
                      if (nameTextFieldController.text.isEmpty ||
                          patternTextFieldController.text.isEmpty) {
                        modalMessage(context,
                            'Name of project or pattern should\'nt empty');
                      } else {
                        createProject(nameTextFieldController.text, pattern);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 5,
                        fixedSize: const Size(130.0, 40.0)),
                    child: Text(
                      'CREATE',
                      style: GoogleFonts.bebasNeue(
                          fontSize: 24, color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
