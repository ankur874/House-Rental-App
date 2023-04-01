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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController controller = Get.find();

    TextEditingController emailController = TextEditingController();
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
                  child: CircularProgressIndicator(
                    color: primaryBlue,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const Header(
                          title: "Welcome Back!",
                          subTitle:
                              "Log In to your Placoo account to explore your dream place to live across the whole world!"),
                      TextFeildContainer(
                        obscureText: false,
                        controller: emailController,
                        text: "Email",
                        icon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            "assets/icons/ProfileGrey.svg",
                          ),
                        ),
                      ),
                      TextFeildContainer(
                        obscureText: true,
                        controller: passwordController,
                        text: "Password",
                        icon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset("assets/icons/keygrey.svg"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          controller
                              .login(
                                  emailController.text, passwordController.text)
                              .then((value) => value == true
                                  ? Get.to(MainScreen())
                                  : Get.snackbar("Login Failed",
                                      "Email or Password wrong"));
                        },
                        child: const ColoredButton(
                            text: "Login",
                            color: primaryBlue,
                            textColor: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                      const Or(),
                      GestureDetector(onTap: () {}, child: const GoogleButton())
                    ],
                  ),
                ),
        ));
  }
}
