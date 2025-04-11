import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracker Sheet',
      home: SwipeListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SwipeListScreen extends StatefulWidget {
  @override
  _SwipeListScreenState createState() => _SwipeListScreenState();
}

class _SwipeListScreenState extends State<SwipeListScreen> {
  List<String> items = List.generate(20, (index) => 'Ingredient ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 187, 230, 241),
      appBar: AppBar(
        title: Text('"Cooking Ingredients"'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 220, 115, 9),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            background: Container(
              color: const Color.fromARGB(255, 19, 83, 135),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),

              child: Icon(Icons.edit, color: Colors.white, size: 30),
            ),
            secondaryBackground: Container(
              color: const Color.fromARGB(255, 180, 45, 35),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  items.removeAt(index);
                });

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('$item deleted')));
              } else if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Edit $item')));
              }
            },
            child: Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                title: Text(item),
                //leading: Icon(Icons.list),
              ),
            ),
          );
        },
      ),
    );
  }
}
