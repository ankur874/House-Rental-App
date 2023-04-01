import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Profile-Service/Controllers/ProfileController.dart';

import '../../Constants.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    int value = 0;
    bool loading = false;
    return Scaffold(
      body: Center(
        child: Obx(
          () => Container(
            color: profileController.user.value.isHost!
                ? Colors.yellow
                : Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "You will not be able to buy property once you switch to hoisting mode",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: font_xm,
                        color: foundation_dark,
                        fontFamily: 'SF Pro Display',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                AnimatedToggleSwitch<bool>.dual(
                  current: profileController.user.value.isHost!,
                  first: false,
                  second: true,
                  dif: MediaQuery.of(context).size.width / 3,
                  borderColor: Colors.transparent,
                  borderWidth: 5.0,
                  height: 55,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                  onChanged: (b) {
                    profileController.user.value.isHost = b;
                    print(b);
                    profileController.switchUserState();
                    return Future.delayed(Duration(seconds: 2));
                  },
                  colorBuilder: (b) => b ? Colors.yellow : Colors.green,
                  iconBuilder: (value) => value
                      ? Icon(Icons.person_off_outlined)
                      : Icon(Icons.home),
                  textBuilder: (value) => value
                      ? Center(child: Text('Switch to Buyer'))
                      : Center(child: Text('Switch to Host ')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
