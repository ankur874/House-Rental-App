import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Detail&RequestService/Controllers/PropertyController.dart';

class DetailsScreenOwnerDetails extends StatelessWidget {
  const DetailsScreenOwnerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyController propertyController = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding_m, vertical: padding_s),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Row(children: [
              SvgPicture.asset("assets/icons/profile-temp.svg"),
              SizedBox(
                width: 6,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    propertyController.property.value.userId?.name == null
                        ? ""
                        : propertyController.property.value.userId!.name!,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: font_m,
                        fontFamily: 'SF Pro Display',
                        fontStyle: FontStyle.normal,
                        color: foundation_dark),
                  ),
                  Text(
                    "Property owner",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: font_s,
                        fontFamily: 'SF Pro Display',
                        fontStyle: FontStyle.normal,
                        color: grey_text_color),
                  )
                ],
              ),
            ]),
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(padding_xxxs),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 1,
                            color: Colors.grey.withOpacity(0.9))
                      ]),
                  child: SvgPicture.asset("assets/icons/message-text.svg")),
              SizedBox(
                width: 14,
              ),
              Container(
                  padding: EdgeInsets.all(padding_xxxs),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 1,
                            color: Colors.grey.withOpacity(0.9))
                      ]),
                  child: SvgPicture.asset("assets/icons/message-text.svg")),
            ],
          )
        ],
      ),
    );
  }
}
