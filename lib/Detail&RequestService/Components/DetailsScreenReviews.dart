import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Detail&RequestService/Controllers/PropertyController.dart';
import 'package:house_rental_app/Detail&RequestService/Models/GetPropertyIDResponse.dart';
import 'package:house_rental_app/Property-Service/PropertyResponse.dart';

class DetailsScreenReviews extends StatelessWidget {
  const DetailsScreenReviews({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyController propertyController = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding_m, vertical: padding_s),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Testimonials",
          style: TextStyle(
            color: foundation_dark,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Display',
            fontStyle: FontStyle.normal,
            fontSize: font_xm,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: propertyController.property.value.reviews!.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, idx) {
              return ReviewCard(
                  review: propertyController.property.value.reviews![idx]);
            })
      ]),
    );
  }
}

class ReviewCard extends StatelessWidget {
  Reviews review;
  ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: SvgPicture.asset("assets/icons/profile-temp.svg"),
                title: Text(
                  review.userId!.name!,
                  style: TextStyle(
                    color: foundation_dark,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'SF Pro Display',
                    fontStyle: FontStyle.normal,
                    fontSize: font_m,
                  ),
                ),
                subtitle: Container(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset("assets/icons/stars.svg")),
              ),
              Text(
                review.review!,
                style: TextStyle(
                  color: grey_text_color,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal,
                  fontSize: font_s,
                ),
              )
            ],
          ),
        ));
  }
}
