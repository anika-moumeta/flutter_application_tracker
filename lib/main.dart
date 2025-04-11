import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 159, 28, 128),
            foregroundColor: Colors.white,
            elevation: 2,
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onPressedLoginButton() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Successfull")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 159, 28, 128),
        title: Center(
          child: Text(
            "Login page",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextFromField(hintText: "Enter Email", controller: _email),
              const SizedBox(height: 30),
              customTextFromField(hintText: "Password", controller: _password),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _onPressedLoginButton,
                child: Text("Log In"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField customTextFromField({
    required String hintText,
    required TextEditingController controller,
  }) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      validator: (String? value) {
        if (value?.trim().isEmpty ?? true) {
          return "Must Enter $hintText ";
        }
        return null;
      },
      controller: controller,
    );
  }
}
