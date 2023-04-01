import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Profile-Service/Controllers/ProfileController.dart';
import 'package:house_rental_app/Profile-Service/Views/shared/ProfileHeader.dart';
import 'package:house_rental_app/Profile-Service/Views/shared/ProfileOptions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryBlue,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // const SizedBox(
                    //   height: 35,
                    // ),
                    ProfileHeader(
                        image: "",
                        email: controller.user.value.email.toString(),
                        name: controller.user.value.name.toString()),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      height: 1,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    ProfileOptions()
                  ],
                ),
              ),
      ),
    );
  }
}
