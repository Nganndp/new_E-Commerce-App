import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/register_view.dart';
import 'package:ecommerce_app/view/auth/second_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button_social.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                    text: 'Welcome',
                    fontSize: 30,
                  ),
                  // ignore: prefer_const_constructors
                  GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: CustomText(
                      text: 'Sign up',
                      fontSize: 20,
                      color: primaryColor,
                    ),
                  )
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              // ignore: prefer_const_constructors
              CustomText(
                text: 'Sign in to continue',
                fontSize: 14,
                color: Colors.grey,
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
              CustomText(
                text: "Forgot Password?",
                fontSize: 14,
                alignment: Alignment.topRight,
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
                    controller.signInWithEmailAndPassword();
                  }

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SecondScreen(),
                  //   ),
                  // );
                  // Get.to(SecondScreen());
                },
                text: 'SIGN IN',
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              // ignore: prefer_const_constructors
              CustomText(
                text: '-OR-',
                alignment: Alignment.center,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 40,
              ),
              // ignore: deprecated_member_use
              // ignore: missing_required_param
              CustomButtonSocial(
                text: 'Sign In with Facebook',
                onPress: () {
                  controller.facebookSignInMethod();
                },
                imageName: 'assets/images/facebook.png',
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              // ignore: deprecated_member_use
              // ignore: missing_required_param
              CustomButtonSocial(
                text: 'Sign In with Google',
                onPress: () {
                  controller.googleSignInMethod();
                },
                imageName: 'assets/images/google.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
