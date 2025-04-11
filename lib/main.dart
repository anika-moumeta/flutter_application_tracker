import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavScreen(),
    );
  }
}

class BottomNavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'Animal Lovers',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(), // Prevents swipe navigation
          children: [HomeScreen(), AnimalScreen(), ProfileScreen()],
        ),
        bottomNavigationBar: TabBar(
          labelColor: const Color.fromARGB(255, 18, 95, 157),
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.transparent, // Removes indicator animation
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.camera), text: 'Animals'),
            Tab(icon: Icon(Icons.person), text: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Home Screen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          SizedBox(height: 10),
          Image.asset('assets/images/cat1.jpg', width: 550, height: 500),
        ],
      ),
    );
  }
}

class AnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Wild Animals',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          SizedBox(height: 10),
          Image.asset('assets/images/tiger.jpg', width: 550, height: 500),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/girl.png"),
            radius: 150,
          ),
          SizedBox(height: 8),
          Text(
            'Anika Afrin Moumeta',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 218, 93, 93),
              fontFamily: GoogleFonts.amarante().fontFamily,
            ),
          ),
          Text(
            'Student | Daffodil International University | Animal Lover',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
