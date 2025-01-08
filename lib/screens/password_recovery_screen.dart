import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:installpay/screens/change_password_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final TextEditingController _emailController = TextEditingController();

  void _sendRecoveryCode() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset email sent!")),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ChangePasswordScreen(), // Replace with your actual screen
        ),
      );
    } catch (e) {
      // Handle errors like invalid email.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 16.0,
            right: 16.0,
            child: Image.asset(
              'images/logo.png', // Path to your logo
              height: 200.0, // Adjust the size as needed
              width: 200.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(height: 80),
                        Container(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "images/logo.png",
                            )),
                        Text(
                          " installpay",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Password Recovery",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Please put your information below to log in to your account",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                        controller: _emailController, label: "Email"),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                  label: "Send Code",
                  onPressed: _sendRecoveryCode,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
