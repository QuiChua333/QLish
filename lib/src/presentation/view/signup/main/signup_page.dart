import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signup_controller.dart';




class SignUpPage extends StatelessWidget{
  SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SignUpController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Hello"),
            ),
            body: Text(
              "Sign up",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );

  }


}