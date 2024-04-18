import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/view/home/main/home_controller.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Hello"),
            ),
            body: Text(
              "Hello Home",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );

  }


}