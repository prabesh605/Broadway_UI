import 'package:broadway_example_ui/product%20firebase/otp_screen.dart';
import 'package:broadway_example_ui/product%20firebase/product_firebase_service.dart';
import 'package:broadway_example_ui/product%20firebase/product_screen.dart';
import 'package:broadway_example_ui/product%20firebase/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void sendOtp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        final response = await FirebaseAuth.instance.signInWithCredential(
          credential,
        );
        print(response.user?.phoneNumber);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProductScreen()),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      },
      codeSent: (String verificationId, int? resendToken) {
        print("VerificationID:$verificationId");
        print("resendToken: $resendToken");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(vericationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
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
              controller: phoneController,
              decoration: InputDecoration(
                label: Text(
                  "Phone Number",
                  style: TextStyle(color: Colors.white),
                ),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                sendOtp();
              },
              child: Text("Login with Phone"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
