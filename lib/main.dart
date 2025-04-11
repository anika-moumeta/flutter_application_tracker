import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracker Sheet',
      home: AnimatedContainerExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 146, 255),
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(height: 30),
            Text(
              'Animated Container',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 246, 146, 255),
        centerTitle: true,
      ),

      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: _isChanged ? 300 : 200,
          height: _isChanged ? 300 : 200,

          decoration: BoxDecoration(
            color:
                _isChanged
                    ? const Color.fromARGB(255, 117, 17, 17)
                    : const Color.fromARGB(255, 24, 87, 139),
            borderRadius: BorderRadius.circular(_isChanged ? 100 : 0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isChanged = !_isChanged;
          });
        },
        child: Icon(Icons.play_arrow),
        backgroundColor: const Color.fromARGB(255, 16, 61, 97),
        foregroundColor: Colors.white,
      ),
    );
  }
}
