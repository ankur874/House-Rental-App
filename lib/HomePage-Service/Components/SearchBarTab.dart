import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/HomePage-Service/Controllers/HomePageController.dart';

class SearchBarTab extends StatelessWidget {
  const SearchBarTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.find();
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: padding_m, vertical: padding_xm),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              homePageController.homePage.value.title1 == null
                  ? ""
                  : homePageController.homePage.value.title1!,
              style: TextStyle(
                color: grey_text_color,
                fontSize: font_s,
                fontWeight: FontWeight.w400,
                fontFamily: 'SF Pro Display',
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                SvgPicture.asset("assets/icons/location.svg"),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Surabaya, Indonesia",
                  style: TextStyle(
                    color: foundation_dark,
                    fontSize: font_xm,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF Pro Display',
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.arrow_downward_outlined,
                  color: foundation_dark,
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              decoration: InputDecoration(
                  // enabled: true,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: padding_l, vertical: padding_m),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(padding_xs),
                    child: SvgPicture.asset(
                      "assets/icons/setting-5.svg",
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(padding_xs),
                    child: SvgPicture.asset("assets/icons/search-normal.svg"),
                  ),
                  filled: true,
                  fillColor: grey_bg_color,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: grey_border_color, width: 0.8),
                      borderRadius: BorderRadius.circular(72)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: grey_border_color, width: 0.8),
                      borderRadius: BorderRadius.circular(72)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: grey_border_color, width: 0.8),
                      borderRadius: BorderRadius.circular(72)),
                  hintText: "Search address, city, location",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: font_m,
                    color: grey_text_color,
                    fontFamily: 'SF Pro Display',
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
