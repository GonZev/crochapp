import 'package:crochapp/controller/pattern_hive_functions.dart';
import 'package:crochapp/models/pattern_model.dart';
import 'package:crochapp/pages/widgets/modal_message.dart';
import 'package:crochapp/singleton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void createPattern(String nameText, String patternText) {
  PatternHiveFunctions.createPattern({
    "name": nameText,
    "content": patternText,
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

class CreatePatternPage extends StatefulWidget {
  const CreatePatternPage({super.key});

  @override
  State<CreatePatternPage> createState() => _CreatePatternPageState();
}

class _CreatePatternPageState extends State<CreatePatternPage> {
  //controllers of fields
  final nameTextFieldController = TextEditingController();
  final addRoundTextFieldController = TextEditingController();
  final patternTextFieldController = TextEditingController();

  //Local variable where we save
  //the hive data of current context
  List myHiveData = [];

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
                  'New Pattern',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 36,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),

              // NOTE: FIELD NAME PATTERN
              TextField(
                controller: nameTextFieldController,
                textAlign: TextAlign.start,
                decoration: const InputDecoration(
                  hintText: 'Name pattern',
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Round',
                  style: GoogleFonts.bebasNeue(fontSize: 28),
                ),
              ),

              //NOTE: FIELD ADD ROUND
              TextField(
                controller: addRoundTextFieldController,
                textAlign: TextAlign.start,
                decoration: const InputDecoration(
                  hintText: 'R1. ...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              //NOTE: BUTTON ADD ROUND
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    patternTextFieldController.text = writeRound(
                        addRoundTextFieldController,
                        patternTextFieldController);
                    addRoundTextFieldController.clear();
                  });
                },
                style: OutlinedButton.styleFrom(
                    elevation: 10.0,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(4)),
                child: Text(
                  'ADD',
                  style:
                      GoogleFonts.bebasNeue(fontSize: 22, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: TextField(
                        controller: patternTextFieldController,
                        minLines: 1,
                        maxLines: 300,
                        readOnly: false,
                        style: GoogleFonts.bebasNeue(fontSize: 18),
                        decoration: const InputDecoration(
                          hintText: 'text patterns ... ',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                                style: BorderStyle.solid),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.all(4)),
                            child: Text(
                              'EDIT',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 22, color: Colors.white),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                elevation: 10.0,
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.all(8)),
                            child: Text(
                              'ADD IMAGE',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              ElevatedButton(
                  onPressed: () {
                    if (nameTextFieldController.text.isEmpty ||
                        patternTextFieldController.text.isEmpty) {
                      modalMessage(context,
                          'Name of pattern or Pattern should\'nt empty');
                    } else {
                      createPattern(nameTextFieldController.text,
                          patternTextFieldController.text);

                      // here send info of pattern
                      // if the screen previous is about new project
                      // i use Singleton for share data
                      if (Singleton().backto) {
                        final listPatterns =
                            PatternHiveFunctions.getAllPatterns();
                        Singleton().pattern = PatternModel(
                            listPatterns.length - 1,
                            nameTextFieldController.text,
                            patternTextFieldController.text);
                        Singleton().backto = false;

                        print(Singleton().pattern.name);
                        print(Singleton().pattern.content);
                      }

                      nameTextFieldController.text = '';
                      patternTextFieldController.text = '';

                      Navigator.of(context).pop();
                      // Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 5,
                      fixedSize: const Size(128.0, 40.0)),
                  child: Text(
                    'CREATE',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 24, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
