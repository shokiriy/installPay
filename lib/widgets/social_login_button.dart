import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 80,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white60, width: 1.0),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
