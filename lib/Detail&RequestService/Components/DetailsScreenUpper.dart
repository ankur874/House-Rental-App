import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Detail&RequestService/Controllers/PropertyController.dart';
import 'package:house_rental_app/Saved-Service/Controllers/SavedController.dart';

class DetailScreenUpper extends StatelessWidget {
  String id;
  DetailScreenUpper({required this.id});

  @override
  Widget build(BuildContext context) {
    PropertyController propertyController = Get.find();
    SavedController savedController = Get.put(SavedController());
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: padding_m, vertical: padding_xxxs),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 3,
                    child: Text(
                      propertyController.property.value!.title!,
                      maxLines: 2,
                      style: TextStyle(
                          color: foundation_dark,
                          fontSize: font_xm,
                          fontWeight: FontWeight.w600),
                    )),
                GestureDetector(
                  onTap: () {
                    bool isPresent = savedController.isPresentInSaved(id);
                    print(isPresent);
                    if (isPresent) {
                      savedController.removeToFav(id);
                      print("removed");
                    } else {
                      savedController.addToFav(id);
                      print("added");
                    }
                  },
                  child: Flexible(
                      flex: 2,
                      child: savedController.isPresentInSaved(id)
                          ? savedController.isAddingToFav == true
                              ? Image.asset(
                                  "assets/gif/heart.gif",
                                  height: 20,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/heart.svg",
                                  alignment: Alignment.centerRight,
                                  color: Colors.orange,
                                )
                          : savedController.isAddingToFav == true
                              ? Image.asset(
                                  "assets/gif/heart.gif",
                                  height: 20,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/heart.svg",
                                  alignment: Alignment.centerRight,
                                )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            // color: Colors.red,
            height: 75,
            child: GridView.count(
              clipBehavior: Clip.none,
              // primary: false,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 5,
              // mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/star.svg",
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text:
                              propertyController.property.value!.rating == null
                                  ? ""
                                  : propertyController.property.value!.rating!
                                      .toString(),
                          style: TextStyle(
                              fontFamily: "SF Pro Display",
                              fontStyle: FontStyle.normal,
                              color: foundation_dark,
                              fontSize: font_m,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text:
                                  "(${propertyController.property.value!.reviews == null ? "" : propertyController.property.value!.reviews!.length})",
                              style: TextStyle(
                                  fontFamily: "SF Pro Display",
                                  fontStyle: FontStyle.normal,
                                  color: grey_text_color,
                                  fontSize: font_m,
                                  fontWeight: FontWeight.w400),
                            ),
                          ]),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/star.svg",
                      height: 20,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${propertyController.property.value!.bedrooms} rooms",
                      style: TextStyle(
                        color: grey_text_color,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF Pro Display',
                        fontStyle: FontStyle.normal,
                        fontSize: font_s,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/locationGrey.svg",
                      height: 20,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${propertyController.property.value!.city}, ${propertyController.property.value!.country}",
                      style: TextStyle(
                        color: grey_text_color,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF Pro Display',
                        fontStyle: FontStyle.normal,
                        fontSize: font_s,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/home-hashtag.svg",
                      height: 20,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${propertyController.property.value!.totalArea} m2",
                      style: TextStyle(
                        color: grey_text_color,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF Pro Display',
                        fontStyle: FontStyle.normal,
                        fontSize: font_s,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
