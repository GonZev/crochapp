import 'package:crochapp/pages/widgets/circle_mini.dart';
import 'package:crochapp/pages/widgets/modal_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int numberPoints = 0;
  int numberPointsOfRound = 0;
  int numberRounds = 0;
  bool stateSectionPoints = true;
  bool stateSectionMainCounter = true;
  final roundPointsController = TextEditingController();
  final roundController = TextEditingController();
  final counterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      stateSectionMainCounter = !stateSectionMainCounter;
                    });
                  },
                  icon: stateSectionMainCounter
                      ? const Icon(Icons.lock)
                      : const Icon(Icons.lock_open_rounded),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counterController.clear();
                      roundController.clear();
                      roundPointsController.clear();
                    });
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            Opacity(
              opacity: stateSectionMainCounter ? 0.8 : 1.0,
              child: AbsorbPointer(
                absorbing: stateSectionMainCounter,
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.all(24.0),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 91, 91, 169),
                      shape: BoxShape.circle),
                  child: Center(
                    child: TextField(
                        controller: counterController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: GoogleFonts.bebasNeue(
                            fontSize: 140, color: Colors.white),
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: '0',
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center),
                        onSubmitted: (value) {
                          numberPoints = int.parse(counterController.text);
                          if (numberPoints.isNaN) {
                            numberPoints = 0;
                          }

                          counterController.text = numberPoints.toString();
                        }),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    iconSize: 80,
                    onPressed: () {
                      setState(() {
                        numberPoints = plusOrMinusPoint('+', numberPoints);
                        if (numberPointsOfRound > 0) {
                          if (numberPointsOfRound != 0 &&
                              numberPoints == numberPointsOfRound) {
                            numberRounds = numberRounds + 1;
                          }
                          if (numberPoints > numberPointsOfRound) {
                            numberPoints = 1;
                          }

                          roundController.text = numberRounds.toString();
                        }

                        counterController.text = numberPoints.toString();
                      });
                    },
                    icon: const Icon(Icons.plus_one)),
                IconButton(
                    iconSize: 80,
                    onPressed: () {
                      setState(() {
                        numberPoints = plusOrMinusPoint('-', numberPoints);
                        counterController.text = numberPoints.toString();
                      });
                    },
                    icon: const Icon(Icons.exposure_minus_1)),
              ],
            ),
            //Section Text of round and points
            Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    stateSectionPoints = !stateSectionPoints;
                  });
                },
                icon: stateSectionPoints
                    ? const Icon(Icons.lock)
                    : const Icon(Icons.lock_open_rounded),
              ),
            ),

            Opacity(
              opacity: stateSectionPoints ? 0.5 : 1.0,
              child: AbsorbPointer(
                absorbing: stateSectionPoints,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.black12),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        circleMini(
                          TextField(
                              enabled: numberPointsOfRound > 0,
                              controller: roundController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: GoogleFonts.bebasNeue(
                                fontSize: 30,
                              ),
                              decoration: const InputDecoration(
                                  hintText: '0',
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center),
                              onSubmitted: (value) {
                                numberRounds = int.parse(roundController.text);
                                if (numberRounds.isNaN) {
                                  numberRounds = 0;
                                }
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            'ROUND',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'OF',
                        style: GoogleFonts.bebasNeue(fontSize: 24),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        circleMini(
                          TextField(
                              controller: roundPointsController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: GoogleFonts.bebasNeue(
                                fontSize: 30,
                              ),
                              decoration: const InputDecoration(
                                  hintText: '0',
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center),
                              onSubmitted: (value) {
                                numberPointsOfRound =
                                    int.parse(roundPointsController.text);
                                if (numberPointsOfRound.isNaN) {
                                  numberPointsOfRound = 0;
                                }

                                if (numberPointsOfRound == 1) {
                                  modalMessage(context,
                                      'The amount of stitches on the round must be greater than 1.');

                                  numberPointsOfRound = 0;
                                  numberPoints = 0;
                                  numberRounds = 0;

                                  counterController.clear();
                                  roundController.clear();
                                  roundPointsController.clear();
                                }
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            'POINTS',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

plusOrMinusPoint(String sign, int point) {
  int newPoint = point;
  if (sign == '+') {
    newPoint = point + 1;
  } else {
    if (newPoint > 0) {
      newPoint = point - 1;
    }
  }

  return newPoint;
}
