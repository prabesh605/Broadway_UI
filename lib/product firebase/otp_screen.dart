import 'package:broadway_example_ui/product%20firebase/product_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.vericationId});
  final String vericationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();
  verifyOtp() async {
    final credential = PhoneAuthProvider.credential(
      verificationId: widget.vericationId,
      smsCode: otpController.text,
    );
    Navigator.pop(context, credential);
    try {
      final response = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      print(response.user?.phoneNumber);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen()),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: otpController,
                decoration: InputDecoration(
                  label: Text("OTP", style: TextStyle(color: Colors.white)),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // sendOtp();
                  verifyOtp();
                },
                child: Text("Verify"),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
