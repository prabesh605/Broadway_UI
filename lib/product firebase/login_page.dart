import 'package:broadway_example_ui/product%20firebase/product_firebase_service.dart';
import 'package:broadway_example_ui/product%20firebase/product_screen.dart';
import 'package:broadway_example_ui/product%20firebase/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPageFirebase extends StatefulWidget {
  const LoginPageFirebase({super.key});

  @override
  State<LoginPageFirebase> createState() => _LoginPageFirebaseState();
}

class _LoginPageFirebaseState extends State<LoginPageFirebase> {
  ProductFirebaseService service = ProductFirebaseService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    checkUserLogin();
  }

  Future<void> checkUserLogin() async {
    final uid = await service.currentUser();
    if (uid.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("Email", style: TextStyle(color: Colors.white)),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Password", style: TextStyle(color: Colors.white)),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final userID = await service.signIn(
                  emailController.text,
                  passwordController.text,
                );
                if (userID.isNotEmpty) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProductScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Enter correct Login and Password"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                // print(response);
              },
              child: Text("Login"),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPageFirebase()),
                );
              },
              child: Text("Create New Account"),
            ),
          ],
        ),
      ),
    );
  }
}
