import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

modalMessage(context, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 100),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(children: [
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      text: message,
                      style: GoogleFonts.bebasNeue(
                          fontSize: 20, color: Colors.black)),
                ),
              ]),
            ),
          ),
        );
      });
}
