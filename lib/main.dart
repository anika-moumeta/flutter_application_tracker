import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageLinks = [
    "https://onestep4ward.com/wp-content/uploads/2011/08/dreamstime_xxl_55742473-1536x1207.jpg",
    "https://cdn.dhakapost.com/media/imgAll/BG/2021October/bagerhat-20211017170638.jpg",
    "https://cdn.dhakapost.com/media/imgAll/BG/2021October/sreemangal-20211017170532.jpg",
    "https://cdn.dhakapost.com/media/imgAll/BG/2021October/kuakata-20211017170353.jpg",
    "https://cdn.dhakapost.com/media/imgAll/BG/2021October/tanguar-20211017170319.jpg",
    "https://cdn.dhakapost.com/media/imgAll/BG/2021October/cover-20211017171031.jpg",
    "https://th.bing.com/th/id/OIP.Sylw2IWh00Y_9jNiEq9N6gHaE_?w=266&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.GYc0OVKYtf7WhYgfVbyYNwAAAA?rs=1&pid=ImgDetMain",
    "https://nijhoom.com/wp-content/uploads/2021/03/sonargaon-museum-boro-sardar-bari-hall-768-o-1.jpg",
    "https://th.bing.com/th/id/R.babdffcb77c5cee460d899d118e56d10?rik=Y1Zp8E9q0G1P3g&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/R.1a9623303e1d6b087dfcf4e3d99d43f8?rik=jtD%2bMxD4F7O8%2fw&pid=ImgRaw&r=0",
    "https://cinebuzztimes.com/wp-content/uploads/2022/04/paharpur.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 221, 49, 58),
        title: Center(
          child: Text(
            "Places To Visit In BD",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: imageLinks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              //height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imageLinks[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}