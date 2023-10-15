import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
      required this.buttonText, 
      required this.onPressed, 
      super.key,
      this.isLoading = false
    });

  final String buttonText;
  final bool isLoading;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return 
     GestureDetector(
      onTap: onPressed,
      child: Material(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 68,
          width: double.infinity,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 43, 97, 142),
            border: Border.all(color: const Color.fromARGB(255, 30, 76, 116), width: 3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: isLoading 
            ? const Center(child: CircularProgressIndicator(color: Colors.white))
            : Center(child: Text(
              buttonText, 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            )),
          ),
        ),
      );
  }
}
