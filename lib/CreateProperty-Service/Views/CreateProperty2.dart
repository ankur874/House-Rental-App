import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Components/TextFeildContainer.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/CreateProperty-Service/Controllers/CreatePropertyController.dart';
import 'package:house_rental_app/Components/Calendar.dart';
import 'package:house_rental_app/CreateProperty-Service/Components/CreatePropertyButton.dart';

import 'package:house_rental_app/CreateProperty-Service/Components/CreatePropertyBuyRentTab.dart';

import 'package:house_rental_app/CreateProperty-Service/Components/CreatePropertyHeading.dart';

import '../Components/CreatePropertyAddRemove.dart';
import 'CreateProperty3.dart';

class CreateProperty2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreatepropertyController createpropertyController = Get.find();
    List<String> list = ["Flat", "House", "Cabin", "Studio"];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Enter Property Details",
          style: TextStyle(color: foundation_dark),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Visibility(
              visible: createpropertyController.newProperty.value.rentOrBuy ==
                  "RENT",
              child:
                  CreatePropertyHeading(text: "How long do you want to stay?")),
          Obx(
            () => Visibility(
              visible: createpropertyController.newProperty.value.rentOrBuy ==
                  "RENT",
              child: GestureDetector(
                onTap: () {
                  Get.to(Calendar(
                    startDate: createpropertyController.startDate,
                    endDate: createpropertyController.endDate,
                  ));
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]),
                  child: Row(children: [
                    Icon(Icons.calendar_month),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${createpropertyController.startDate.value}   <->   ${createpropertyController.endDate.value} ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
              ),
            ),
          ),
          CreatePropertyHeading(text: "Property type"),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    createpropertyController.propertyTypeIndex.value = index;
                  },
                  child: Obx(
                    () => CreatePropertyButton(
                      width: 100,
                      text: list[index],
                      pressed: index ==
                              createpropertyController.propertyTypeIndex.value
                          ? true
                          : false,
                    ),
                  ),
                );
              },
            ),
          ),
          CreatePropertyHeading(text: "Rooms and beds"),
          Column(
            children: [
              CreatePropertyAddRemove(
                  title: "Bedrooms", number: createpropertyController.bedrooms),
              CreatePropertyAddRemove(
                  title: "Bathrooms",
                  number: createpropertyController.bathrooms),
              CreatePropertyAddRemove(
                  title: "Kitchens", number: createpropertyController.kitchens),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CreatePropertyHeading(text: "How many guests coming?"),
          CreatePropertyAddRemove(
              title: "Adults", number: createpropertyController.adults),
          CreatePropertyAddRemove(
              title: "Children", number: createpropertyController.children),
          CreatePropertyAddRemove(
              title: "Infants", number: createpropertyController.infants),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: primaryBlue,
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.grey[850], fontSize: 17),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    createpropertyController.newProperty.value.rentStartDate =
                        createpropertyController.startDate.value;
                    createpropertyController.newProperty.value.rentEndDate =
                        createpropertyController.endDate.value;
                    createpropertyController.newProperty.value.propertyType =
                        list[createpropertyController.propertyTypeIndex.value];
                    createpropertyController.newProperty.value.bathrooms =
                        createpropertyController.bathrooms.value;
                    createpropertyController.newProperty.value.bedrooms =
                        createpropertyController.bedrooms.value;
                    createpropertyController.newProperty.value.kitchens =
                        createpropertyController.kitchens.value;
                    createpropertyController.newProperty.value.adults =
                        createpropertyController.adults.value;
                    createpropertyController.newProperty.value.infants =
                        createpropertyController.infants.value;
                    createpropertyController.newProperty.value.children =
                        createpropertyController.children.value;
                    Get.to(CreateProperty3());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: padding_m, horizontal: padding_xm),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[850]),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
