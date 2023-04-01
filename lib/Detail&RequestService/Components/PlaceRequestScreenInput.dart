import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Components/Calendar.dart';
import 'package:house_rental_app/Constants.dart';

import '../Controllers/PropertyController.dart';

class PlaceRequestScreenInput extends StatelessWidget {
  const PlaceRequestScreenInput({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyController propertyController = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      height: 180,
      // width: screenWidth / 1.2,
      // alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xff43434326).withOpacity(0.17),
              offset: Offset(2, 5),
              blurRadius: 30.0,
              spreadRadius: 1),
        ],
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your input details",
                  style: TextStyle(
                    color: foundation_dark,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF Pro Display',
                    fontStyle: FontStyle.normal,
                    fontSize: font_xxm,
                  ),
                ),
              ],
            ),
            Text(
              "Date",
              style: TextStyle(
                color: foundation_dark,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF Pro Display',
                fontStyle: FontStyle.normal,
                fontSize: font_m,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(Calendar(
                    startDate: propertyController.startDate,
                    endDate: propertyController.endDate));
              },
              child: Text(
                "${propertyController.startDate.value} <-> ${propertyController.endDate.value}",
                style: TextStyle(
                  color: grey_text_color,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal,
                  fontSize: font_s,
                ),
              ),
            ),
            SizedBox(height: 2),
            Text(
              "People count",
              style: TextStyle(
                color: foundation_dark,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF Pro Display',
                fontStyle: FontStyle.normal,
                fontSize: font_m,
              ),
            ),
            Row(
              children: [
                Text(
                  "${propertyController.guestCount.value.toString()} people",
                  style: TextStyle(
                    color: grey_text_color,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'SF Pro Display',
                    fontStyle: FontStyle.normal,
                    fontSize: font_s,
                  ),
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      if (propertyController.guestCount.value == 0) {
                      } else {
                        propertyController.guestCount.value--;
                      }
                    },
                    child: Icon(Icons.remove_rounded)),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      if (propertyController.guestCount.value >
                          propertyController.guestLimit.value) {
                      } else {
                        propertyController.guestCount.value++;
                      }
                    },
                    child: Icon(Icons.add_rounded)),
              ],
            ),
            Visibility(
              visible: propertyController.guestCount.value >
                  propertyController.guestLimit.value,
              child: Text(
                "*Max People count limit is ${propertyController.guestLimit.value.toString()}",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
