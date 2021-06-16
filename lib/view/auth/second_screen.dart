import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<AuthViewModel>(
              init: AuthViewModel(),
              // ignore: prefer_const_constructors
              builder: (value) => Text("${value.counter}")),
          GetBuilder<AuthViewModel>(
            // ignore: deprecated_member_use
            builder: (value) => RaisedButton(
              onPressed: () {
                value.increment();
              },
            ),
          )
        ],
      ),
    );
  }
}
