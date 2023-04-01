import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/HomePage-Service/Controllers/HomePageController.dart';

class RentBuyTab extends StatelessWidget {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: padding_m, vertical: padding_xm),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              homePageController.homePage.value.title2 == null
                  ? ""
                  : homePageController.homePage.value.title2!,
              style: TextStyle(
                  fontSize: font_xm,
                  color: foundation_dark,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(
                    vertical: padding_xxs, horizontal: padding_xxs),
                decoration: BoxDecoration(
                    color: grey_bg_color,
                    borderRadius: BorderRadius.circular(75),
                    border: Border.all(color: grey_border_color, width: 0.8)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (homePageController.homePageState.value != "RENT")
                          homePageController.toggleState();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              gradient:
                                  homePageController.homePageState.value ==
                                          "RENT"
                                      ? buttonLinearGradient
                                      : const LinearGradient(colors: [
                                          Colors.transparent,
                                          Colors.transparent
                                        ]),
                              borderRadius: BorderRadius.circular(75)),
                          padding: EdgeInsets.symmetric(vertical: padding_xs),
                          child: Text(
                            homePageController.homePage.value.subtitle1 == null
                                ? ""
                                : homePageController.homePage.value.subtitle1!,
                            style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontStyle: FontStyle.normal,
                                color: homePageController.homePageState.value ==
                                        "RENT"
                                    ? foundation_white
                                    : grey_text_color,
                                fontSize: font_m,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        if (homePageController.homePageState.value != "BUY")
                          homePageController.toggleState();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              gradient:
                                  homePageController.homePageState.value ==
                                          "BUY"
                                      ? buttonLinearGradient
                                      : const LinearGradient(colors: [
                                          Colors.transparent,
                                          Colors.transparent
                                        ]),
                              borderRadius: BorderRadius.circular(75)),
                          padding: EdgeInsets.symmetric(vertical: padding_xs),
                          child: Text(
                            homePageController.homePage.value.subtitle2 == null
                                ? ""
                                : homePageController.homePage.value.subtitle2!,
                            style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontStyle: FontStyle.normal,
                                color: homePageController.homePageState.value ==
                                        "BUY"
                                    ? foundation_white
                                    : grey_text_color,
                                fontSize: font_m,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
