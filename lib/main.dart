import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 134, 134),
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(height: 30),
            Text(
              'Profile Picture',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 214, 134, 134),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      _image != null
                          ? FileImage(_image!)
                          : const AssetImage('assets/images/girl.png')
                              as ImageProvider,
                  child:
                      _image == null
                          ? const Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Color.fromARGB(179, 99, 49, 49),
                          )
                          : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.image, color: Colors.white),
              label: const Text(
                'Choose Image',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 25, 6, 110),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
