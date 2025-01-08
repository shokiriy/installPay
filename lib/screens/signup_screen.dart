import 'package:flutter/material.dart';
import 'package:installpay/screens/login_screen.dart';
import 'package:installpay/widgets/social_login_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signup() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Success! Navigate to the login screen or another page.
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully!")),
      );
    } catch (e) {
      // Handle errors like email already in use, weak password, etc.
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
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
                      "Create a new account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Please enter your information below to create a new account",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextField(controller: _nameController, label: "Name"),
                CustomTextField(controller: _emailController, label: "Email"),
                CustomTextField(
                    controller: _phoneController, label: "Phone Number"),
                CustomTextField(
                  controller: _passwordController,
                  label: "Password",
                  isPassword: true,
                ),
                const SizedBox(height: 16),
                CustomButton(
                  label: "Create Account",
                  onPressed: _signup,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        " Login",
                        style: TextStyle(color: Colors.amberAccent),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text("Or Login with",
                    style: TextStyle(color: Colors.white54)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialLoginButton(
                      image: "images/google.png",
                      onPressed: () {},
                    ),
                    SizedBox(width: 15),
                    SocialLoginButton(
                      image: "images/facebook.png",
                      onPressed: () {},
                    ),
                    SizedBox(width: 15),
                    SocialLoginButton(
                      image: "images/apple.png",
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
