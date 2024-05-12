import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/view/edit_profile/main/edit_profile_page.dart';
import 'package:qlish/src/presentation/view/home/main/home_page.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
        height: 70,
          elevation: 0,
          indicatorColor: AppColors.mainColor,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => { controller.selectedIndex.value = index},
          destinations:  [
            NavigationDestination(icon: Icon(Icons.home, color: controller.selectedIndex.value == 0 ? Colors.white : Color(0xff1A1C3D)), label: "Home"),
            NavigationDestination(icon: Icon(Icons.home, color: controller.selectedIndex.value == 1 ? Colors.white : Color(0xff1A1C3D)), label: "Home"),
            NavigationDestination(icon: Icon(Icons.home, color: controller.selectedIndex.value == 2 ? Colors.white : Color(0xff1A1C3D)), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person, color: controller.selectedIndex.value == 3 ? Colors.white : Color(0xff1A1C3D)), label: "Home"),

          ]
      )),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [HomePage(),HomePage(),HomePage(),EditProfilePage()];
}