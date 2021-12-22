import 'package:flutter/material.dart';
import 'constants.dart';

class ReuseContainer extends StatelessWidget {
  List<Widget> children = [];
  Function()? onTap;
  Color color;
  ReuseContainer(
      {required this.children, this.onTap, this.color = inactiveColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          ),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: activeColor, width: 3.0),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
