import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:house_rental_app/Authentication-Service/Controllers/AuthenticationController.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Authentication-Service/Views/shared/ColoredButton.dart';
import 'package:house_rental_app/Authentication-Service/Views/shared/GoogleButton.dart';
import 'package:house_rental_app/Authentication-Service/Views/shared/Header.dart';
import 'package:house_rental_app/Authentication-Service/Views/shared/Or.dart';
import 'package:house_rental_app/Components/TextFeildContainer.dart';
import 'package:house_rental_app/HomePage-Service/Views/HomeScreen.dart';
import 'package:house_rental_app/MainScreen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController controller = Get.find();

    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(color: primaryBlue),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const Header(
                        title: "Let's explore together!",
                        subTitle:
                            "Create your Placoo account to explore your dream place to live across the whole world!"),
                    TextFeildContainer(
                      controller: emailController,
                      obscureText: false,
                      text: "Email",
                      icon: const Icon(
                        Icons.email,
                        size: 20,
                      ),
                    ),
                    TextFeildContainer(
                        controller: usernameController,
                        text: "Name",
                        obscureText: false,
                        icon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child:
                              SvgPicture.asset("assets/icons/ProfileGrey.svg"),
                        )),
                    TextFeildContainer(
                        controller: passwordController,
                        text: "Password",
                        obscureText: true,
                        icon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset("assets/icons/keygrey.svg"),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        controller
                            .signUp(
                                emailController.text,
                                passwordController.text,
                                usernameController.text)
                            .then((value) => value == true
                                ? Get.to(MainScreen())
                                : Get.snackbar("Error", "User Already Exists"));
                      },
                      child: const ColoredButton(
                          text: "Create Account",
                          color: primaryBlue,
                          textColor: Colors.white),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    const Or(),
                    GestureDetector(child: const GoogleButton()),
                  ],
                ),
              ),
      ),
    );
  }
}
