import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 188, 224),
        elevation: 50,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/girl.png"),
              radius: 25,
            ),
            SizedBox(width: 15), // optional spacing
            Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Home Screen",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 140, 44, 15),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Customize App Bar, Logo, Title, Action Button",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 65, 36, 26),
              ),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/cat1.jpg", width: 450, height: 500),
          ],
        ),
      ),
    );
  }
}
