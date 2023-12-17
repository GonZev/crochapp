import 'package:flutter/material.dart';

circleMini(TextField child) {
  return Container(
    height: 50,
    width: 50,
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 8.0),
    decoration: BoxDecoration(
        color: const Color.fromARGB(99, 174, 174, 225),
        shape: BoxShape.circle,
        border: Border.all(width: 4.0, color: Colors.lightBlue),
        boxShadow: const [
          BoxShadow(
              color: Colors.grey, offset: Offset(0.0, 2.0), blurRadius: 10.0)
        ]),
    child: child,
  );
}
