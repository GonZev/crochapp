import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

modalMessage(context, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: SizedBox(
            height: 100,
            width: 300,
            // constraints: const BoxConstraints(maxHeight: 100, maxWidth: 300),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(children: [
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: message,
                        style: GoogleFonts.bebasNeue(
                            fontSize: 20, color: Colors.black)),
                  ),
                ),
              ]),
            ),
          ),
        );
      });
}
