import 'package:flutter/material.dart';
import 'constants.dart';

class ButtomActiveBar extends StatelessWidget {
  Function()? onTap;
  String text;

  ButtomActiveBar({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        height: 80,
        color: activeColor,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
