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
          backgroundColor: const Color.fromARGB(255, 113, 128, 224),
        ),
        body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Center(
                child: Text(
                  "Item Number: $index",
                  style: GoogleFonts.charm(),
                  selectionColor: Color.fromARGB(0, 16, 164, 36),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
