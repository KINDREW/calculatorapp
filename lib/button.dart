import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {super.key,
      required this.color,
      required this.textColor,
      required this.buttonText,
      required this.Tapped
      });

  final color;
  final textColor;
  final String buttonText;
  final Tapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Tapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: textColor, fontSize: 25.0),
            ),
          ),
        ),
      ),
    );
  }
}
