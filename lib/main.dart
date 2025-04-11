import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: Text(
          "Animal Lovers",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 38, 90, 101),
      ),
      drawer: NaviDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Home Screen",
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 38, 90, 101),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  "assets/images/cat1.jpg",
                  fit: BoxFit.cover,
                  height: 600,
                  width: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NaviDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 199, 223),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/girl.png"),
                  radius: 30,
                ),
                SizedBox(height: 8),
                Text(
                  'Anika Afrin Moumeta',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 218, 93, 93),
                    fontFamily: GoogleFonts.amarante().fontFamily,
                  ),
                ),
                Text(
                  'Student | Daffodil International University | Animal Lover',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text("Animals"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnimalScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About Us"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animals",
          style: TextStyle(
            fontSize: 25,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Wild Animals",
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 192, 148, 4),
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          SizedBox(height: 10),
          Image.asset(
            "assets/images/tiger.jpg",
            fit: BoxFit.cover,
            height: 600,
            width: 500,
          ),
        ],
      ),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(
            fontSize: 25,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Animal Lovers",
                    style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 38, 90, 101),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    "assets/images/cat.jpg",
                    fit: BoxFit.cover,
                    height: 400,
                    width: 500,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We are a group of animal lovers who are passionate about wildlife conservation and animal welfare. Our mission is to raise awareness about the importance of protecting animals and their habitats. We believe that every animal deserves a chance to live in a safe and healthy environment.",
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 38, 90, 101),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
