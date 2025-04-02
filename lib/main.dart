import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const StyledTextApp());
}

class StyledTextApp extends StatelessWidget {
  const StyledTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TextStyleScreen(),
    );
  }
}

class TextStyleScreen extends StatelessWidget {
  const TextStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'This is a Text Widget',
              textAlign: TextAlign.center,
              style: GoogleFonts.tinos(
                textStyle: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 5, 110),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Created By Me',
              textAlign: TextAlign.center,
              style: GoogleFonts.emilysCandy(
                textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 144, 45, 149),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'A text with Underline',
              textAlign: TextAlign.center,
              style: GoogleFonts.kings(
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                  color: Color.fromARGB(255, 164, 156, 8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Thank you for using my app',
              textAlign: TextAlign.center,
              style: GoogleFonts.kranky(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 135, 18, 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
