import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final int maxLine;
  final double height;

  // ignore: use_key_in_widget_constructors
  // ignore: prefer_const_constructors_in_immutables
  // ignore: use_key_in_widget_constructors
  const CustomText(
      {this.text = '',
      this.fontSize = 16,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.maxLine,
      this.height = 1});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      alignment: alignment,
      // ignore: prefer_const_constructors
      child: Text(
        text,
        // ignore: prefer_const_constructors
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
        ),
        maxLines: maxLine,
      ),
    );
  }
}
