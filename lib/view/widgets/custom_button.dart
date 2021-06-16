import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constance.dart';
import 'custom_text.dart';

// ignore: use_key_in_widget_constructors
class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final Function onPress;

  CustomButton({
    @required this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor,
  });
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(16),
      onPressed: onPress,
      color: primaryColor,
      // ignore: prefer_const_constructors
      child: CustomText(
        text: text,
        alignment: Alignment.center,
        color: Colors.white,
      ),
    );
  }
}
