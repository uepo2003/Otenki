import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    required this.label,
    required this.press,
    super.key});

    final String label;
    final VoidCallback? press;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press, 
      child: Text(
        label,
        style: const TextStyle(
          color:Color.fromARGB(255, 115, 106, 106), fontSize: 30, fontWeight: FontWeight.bold
        )
      )
      );
  }
}