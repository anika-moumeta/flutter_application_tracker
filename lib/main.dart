import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tracker Sheet"),
          backgroundColor: const Color.fromARGB(255, 101, 102, 190),
        ),
        body: Center(
          child: Text(
            "Hello World!",
            style: TextStyle(
              fontFamily: GoogleFonts.monoton().fontFamily,
              fontSize: 40,
              color: const Color.fromARGB(255, 208, 12, 140),
            ),
          ),
        ),
      ),
    );
  }
}
