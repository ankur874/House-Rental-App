import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:house_rental_app/Detail&RequestService/Controllers/PropertyController.dart';
import 'package:house_rental_app/Detail&RequestService/Views/PlaceRequestScreen.dart';

import '../../Constants.dart';

class DetailsScreenBottomBar extends StatelessWidget {
  const DetailsScreenBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyController propertyController = Get.find();
    return Obx(
      () => Container(
          color: grey_border_color,
          padding: EdgeInsets.symmetric(vertical: padding_m),
          alignment: Alignment.center,
          child: propertyController.isPropRented.value == true
              ? Text(
                  "Request Pending from Property Owner",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF Pro Display',
                    fontStyle: FontStyle.normal,
                    fontSize: font_m,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text:
                                    "Rs. ${propertyController.property.value!.totalPrice} ",
                                style: TextStyle(
                                  color: foundation_dark,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'SF Pro Display',
                                  fontStyle: FontStyle.normal,
                                  fontSize: font_xm,
                                ),
                                children: [
                              TextSpan(
                                  text: "/month",
                                  style: TextStyle(
                                    color: grey_text_color,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SF Pro Display',
                                    fontStyle: FontStyle.normal,
                                    fontSize: font_xm,
                                  ))
                            ])),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Payment estimation",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: foundation_dark,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SF Pro Display',
                            fontStyle: FontStyle.normal,
                            fontSize: font_s,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(PlacerequestScreen());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                            gradient: buttonLinearGradient,
                            borderRadius: BorderRadius.circular(72)),
                        child: Text(
                          "Rent",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SF Pro Display',
                            fontStyle: FontStyle.normal,
                            fontSize: font_m,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
    );
  }
}
