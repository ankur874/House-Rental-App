import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Detail&RequestService/Controllers/PropertyController.dart';

class PlaceRequestScreenPrice extends StatelessWidget {
  const PlaceRequestScreenPrice({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Price details",
            style: TextStyle(
              color: foundation_dark,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro Display',
              fontStyle: FontStyle.normal,
              fontSize: font_xxm,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Staying duration",
                style: TextStyle(
                  color: grey_text_color,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal,
                  fontSize: font_m,
                ),
              ),
              Text(
                "Rs. ${propertyController.property.value!.totalPrice}",
                style: TextStyle(
                  color: foundation_dark,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal,
                  fontSize: font_m,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Service fee",
                style: TextStyle(
                  color: grey_text_color,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal,
                  fontSize: font_m,
                ),
              ),
              Text(
                "Rs. 200",
                style: TextStyle(
                  color: foundation_dark,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal,
                  fontSize: font_m,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total price",
                style: TextStyle(
                  color: foundation_dark,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal,
                  fontSize: font_m,
                ),
              ),
              Text(
                "Rs. ${propertyController.property.value!.totalPrice! + 200}",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SF Pro Display',
                    fontStyle: FontStyle.normal,
                    fontSize: font_m,
                    foreground: Paint()..shader = textLinearGradient),
              )
            ],
          )
        ],
      ),
    );
  }
}
