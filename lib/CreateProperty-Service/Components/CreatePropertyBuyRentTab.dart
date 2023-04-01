import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Explore-Service/Controllers/ExploreServiceController.dart';
import 'package:house_rental_app/CreateProperty-Service/Controllers/CreatePropertyController.dart';

class CreatePropertyBuyRentTab extends StatelessWidget {
  CreatepropertyController createpropertyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Obx(
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
                  if (createpropertyController.propertyState.value != "RENT") {
                    createpropertyController.toggleState();
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        gradient:
                            createpropertyController.propertyState.value ==
                                    "RENT"
                                ? buttonLinearGradient
                                : const LinearGradient(colors: [
                                    Colors.transparent,
                                    Colors.transparent
                                  ]),
                        borderRadius: BorderRadius.circular(75)),
                    padding: EdgeInsets.symmetric(vertical: padding_xs),
                    child: Text(
                      "I need to rent",
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontStyle: FontStyle.normal,
                          color: createpropertyController.propertyState.value ==
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
                  if (createpropertyController.propertyState.value != "BUY") {
                    createpropertyController.toggleState();
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        gradient:
                            createpropertyController.propertyState.value ==
                                    "BUY"
                                ? buttonLinearGradient
                                : const LinearGradient(colors: [
                                    Colors.transparent,
                                    Colors.transparent
                                  ]),
                        borderRadius: BorderRadius.circular(75)),
                    padding: EdgeInsets.symmetric(vertical: padding_xs),
                    child: Text(
                      "I need to buy",
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontStyle: FontStyle.normal,
                          color: createpropertyController.propertyState.value ==
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
    );
  }
}
