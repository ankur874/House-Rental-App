import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/HomePage-Service/Controllers/HomePageController.dart';

import 'package:house_rental_app/HomePage-Service/Components/NearYourLocationTab.dart';
import 'package:house_rental_app/HomePage-Service/Components/RentBuyTab.dart';
import 'package:house_rental_app/HomePage-Service/Components/SearchBarTab.dart';

import '../../CreateProperty-Service/Views/CreateProperty1.dart';
import '../Components/TopRatedTab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(CreateProperty());
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: buttonLinearGradient,
              borderRadius: BorderRadius.circular(100)),
          child: Icon(
            Icons.add_home,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: homePageController.isLoading.value == true
              ? Center(child: Image.asset("assets/gif/loading.gif"))
              : Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    SearchBarTab(),
                    RentBuyTab(),
                    HomeScreenLowerContainer(),
                    HomeScreenLowerBottomContainer(),
                    SizedBox(
                      height: 75,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Explore");
  }
}
