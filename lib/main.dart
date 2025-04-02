import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const NavigationApp());
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/rain.jpg'),
          Text(
            "This is First Screen",
            style: TextStyle(
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 203, 10, 74),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              );
            },
            child: const Text('Go to Second Screen'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 214, 205, 202),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              textStyle: TextStyle(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 203, 10, 74),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/tree.jpg'),
          Text(
            "This is Second Screen",
            style: TextStyle(
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 203, 10, 74),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go to First Screen'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 222, 215, 212),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              textStyle: TextStyle(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 25, 12, 205),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
