import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:house_rental_app/Authentication-Service/Views/WelcomeScreen.dart';
import 'package:house_rental_app/Profile-Service/Controllers/ProfileController.dart';
import 'package:house_rental_app/Profile-Service/Views/EditDetailsScreen.dart';
import 'package:house_rental_app/Profile-Service/Views/ProfileDetailScreen.dart';
import 'package:house_rental_app/Profile-Service/Views/PurchaseHistory.dart';
import 'package:house_rental_app/Profile-Service/Views/SwitchScreen.dart';
import 'package:house_rental_app/Profile-Service/Views/shared/Option.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    var isHost;
    if (profileController.user.value.isHost == false) {
      isHost = "Hosting";
    } else {
      isHost = "Buyer";
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () => Get.to(ProfileDetailScrenn()),
            child: Option(
                text: "Profile Details",
                icon: SvgPicture.asset("assets/icons/ProfileBlack.svg")),
          ),
          InkWell(
              onTap: () => Get.to(EditDetailsScreen()),
              child: Option(text: "Edit Details", icon: Icon(Icons.edit))),
          InkWell(
              onTap: () {
                final prefs = GetStorage();
                prefs.remove("user_id");
                Get.offAll(WelcomeScreen());
              },
              child: Option(text: "Log-Out", icon: Icon(Icons.logout))),
          InkWell(
              onTap: () => Get.to(PurchaseHistory()),
              child: Option(text: "Purchase History", icon: Icon(Icons.paid))),
          InkWell(
            onTap: () => {
              Get.to(SwitchScreen()),
            },
            child: Option(
                text: "Switch to ${isHost} ",
                icon: SvgPicture.asset("assets/icons/Toggle.svg")),
          )
        ],
      ),
    );
  }
}
