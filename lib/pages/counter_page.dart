import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int numberPoints = 0;
  bool stateSectionPoints = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          margin: const EdgeInsets.all(24.0),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 91, 91, 169), shape: BoxShape.circle),
          child: Center(
            child: Text(
              '$numberPoints',
              style: GoogleFonts.bebasNeue(
                  fontSize: 140, color: const Color.fromRGBO(255, 255, 255, 1)),
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
                  });
                },
                icon: const Icon(Icons.plus_one)),
            IconButton(
                iconSize: 80,
                onPressed: () {
                  setState(() {
                    numberPoints = plusOrMinusPoint('-', numberPoints);
                  });
                },
                icon: const Icon(Icons.exposure_minus_1)),
          ],
        ),
        //Section Text of round and points
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 22),
          child: IconButton(
            onPressed: () {
              setState(() {
                stateSectionPoints = !stateSectionPoints;
              });
            },
            icon: const Icon(Icons.lock),
            selectedIcon: const Icon(Icons.lock_open_rounded),
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
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 91, 91, 169),
                          shape: BoxShape.circle),
                      child: Center(
                          child: Text(
                        '0',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 30,
                        ),
                      )),
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
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 91, 91, 169),
                          shape: BoxShape.circle),
                      child: Center(
                          child: Text(
                        '0',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 30,
                        ),
                      )),
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
