import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button_social.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  CustomText(
                    text: 'Sign Up',
                    fontSize: 30,
                  ),
                  // ignore: prefer_const_constructors
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: "Name",
                hint: 'Hoàng Tuấn',
                onSave: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("Error email");
                  }
                },
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: "Email",
                hint: 'nguyenhoangtuan@gmail.com',
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("Error email");
                  }
                },
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: "Password",
                hint: '********',
                onSave: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("Error password");
                  }
                },
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              // Login buttom
              // ignore: deprecated_member_use
              CustomButton(
                onPress: () {
                  _formKey.currentState.save();
                  if (_formKey.currentState.validate()) {
                    controller.createAccountWithEmailAndPassword();
                  }

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SecondScreen(),
                  //   ),
                  // );
                  // Get.to(SecondScreen());
                },
                text: 'SIGN UP',
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
