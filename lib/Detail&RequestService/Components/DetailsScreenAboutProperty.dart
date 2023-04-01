import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Constants.dart';
import '../Controllers/PropertyController.dart';

class DetailsScreenAboutProperty extends StatelessWidget {
  const DetailsScreenAboutProperty({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyController propertyController = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding_m, vertical: padding_s),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Home facilities",
              style: TextStyle(
                color: foundation_dark,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF Pro Display',
                fontStyle: FontStyle.normal,
                fontSize: font_xm,
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20),
                itemCount:
                    propertyController.property.value!.facilities?.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, idx) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: padding_xxs),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/parking.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          propertyController.property.value!.facilities![idx],
                          style: TextStyle(
                            color: foundation_dark,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SF Pro Display',
                            fontStyle: FontStyle.normal,
                            fontSize: font_m,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Text(
              "About location’s neighborhood",
              style: TextStyle(
                color: foundation_dark,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF Pro Display',
                fontStyle: FontStyle.normal,
                fontSize: font_xm,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              propertyController.property.value!.neighbourhoodDetail!,
              style: TextStyle(
                color: grey_text_color,
                fontWeight: FontWeight.w400,
                fontFamily: 'SF Pro Display',
                fontStyle: FontStyle.normal,
                fontSize: font_m,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.all(padding_m),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(width: 0.6, color: grey_text_color)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Average living cost",
                    style: TextStyle(
                      color: grey_text_color,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro Display',
                      fontStyle: FontStyle.normal,
                      fontSize: font_m,
                    ),
                  ),
                  Text(
                    "${propertyController.property.value!.averageLivingCost} Rs./month",
                    style: TextStyle(
                      color: foundation_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontStyle: FontStyle.normal,
                      fontSize: font_m,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
