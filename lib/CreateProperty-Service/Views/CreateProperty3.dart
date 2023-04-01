import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Components/TextFeildContainer.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/CreateProperty-Service/Controllers/CreatePropertyController.dart';
import 'package:house_rental_app/CreateProperty-Service/Components/CreatePropertyButton.dart';
import 'package:house_rental_app/CreateProperty-Service/Components/CreatePropertyBuyRentTab.dart';

import 'package:house_rental_app/CreateProperty-Service/Components/CreatePropertyHeading.dart';

import '../Models/PropertyRequest.dart';
import '../Components/CreatePropertyAddRemove.dart';

class CreateProperty3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreatepropertyController createpropertyController = Get.find();
    print(createpropertyController.newProperty.value.toJson());
    TextEditingController areaController = TextEditingController();
    List<String> list = [
      "Wifi",
      "Parking",
      "Security",
      "Park",
      "Swimming pool",
      "Air Conditiner",
      "Boom Barriers",
      "24*7 Water & Electricity",
      "Cricket Ground",
      "Football Ground",
      "Inboor Stadium",
      "Fully Renowated",
      "Alchol free Zone"
    ];

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
          TextFeildContainer(
              controller: areaController,
              text: "Area in sq.ft",
              icon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.area_chart)),
              obscureText: false),
          CreatePropertyHeading(text: "Price Range"),
          Obx(
            () => Column(
              children: [
                Text(
                  createpropertyController.price.value.toInt().toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Slider(
                  min: 0,
                  max: 100000,
                  value: createpropertyController.price.value,
                  activeColor: primaryBlue,

                  inactiveColor: secondaryblue.withOpacity(0.5),
                  // thumbColor: Colors.white,
                  // label: _currentSliderValue.round().toString(),
                  onChanged: (value) {
                    createpropertyController.price.value = value;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CreatePropertyHeading(text: "Property Facilities"),
          Obx(
            () => Wrap(
              spacing: 10, // gap between adjacent chips
              runSpacing: 20.0, // gap between lines
              children: <Widget>[
                for (int index = 0; index < list.length; index++)
                  FilterChip(
                    padding: EdgeInsets.all(0),
                    labelPadding: EdgeInsets.all(0),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color:
                            (createpropertyController.isSelected[index] == true)
                                ? Colors.white
                                : Colors.black),
                    label: Container(
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryBlue),
                          borderRadius: BorderRadius.circular(30),
                          gradient: createpropertyController.isSelected[index]
                              ? primaryGradient
                              : LinearGradient(colors: [
                                  Colors.grey.withOpacity(0.2),
                                  Colors.grey.withOpacity(0.2)
                                ]),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 5),
                                color:
                                    createpropertyController.isSelected[index]
                                        ? primaryBlue.withOpacity(0.2)
                                        : Colors.white,
                                blurRadius: 10)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${list[index]}",
                          ),
                        ],
                      ),
                    ),
                    onSelected: (bool value) {
                      createpropertyController.isSelected[index] =
                          !createpropertyController.isSelected[index];
                      // print(isSelected);
                    },
                  )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => createpropertyController.imageLoading.value == true
                ? CircularProgressIndicator()
                : Container(
                    // padding: EdgeInsets.all(10),

                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: createpropertyController.imageUrl.value.length,
                      itemBuilder: (ctx, idx) {
                        return ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: Image.network(
                            createpropertyController.imageUrl[idx].downloadUrl!,
                            width: 50,
                          ),
                          title: Text(
                              createpropertyController.imageUrl[idx].name!),
                        );
                      },
                    ),
                  ),
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                if (createpropertyController.imageUrl.value.length > 10) {
                  Get.snackbar(
                    "Maximum Limit Reached!",
                    "Max Limit is 10",
                    colorText: Colors.white,
                    backgroundColor: Colors.lightBlue,
                    icon: const Icon(Icons.add_alert),
                  );
                } else
                  createpropertyController.openImage();
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.black54),
                padding: EdgeInsets.all(10),
                child: createpropertyController.imageLoading.value == true
                    ? Text("Image Uploading , Please Wait!")
                    : Text("Upload Image"),
              ),
            ),
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
                    createpropertyController.newProperty.value.totalArea =
                        int.parse(areaController.text);
                    createpropertyController.newProperty.value.totalPrice =
                        createpropertyController.price.value.toInt();

                    for (int i = 0; i < list.length; i++) {
                      if (createpropertyController.isSelected[i] == true) {
                        createpropertyController.facilities.value.add(list[i]);
                      }
                    }
                    createpropertyController.newProperty.value.facilities =
                        createpropertyController.facilities;
                    print(createpropertyController.facilities);
                    // print("hello");
                    // print(createpropertyController
                    //     .newProperty.value.facilities!.length);
                    List<Photos> photoURL = [];

                    for (int i = 0;
                        i < createpropertyController.imageUrl.length;
                        i++) {
                      Photos newPhoto = Photos(
                          url:
                              createpropertyController.imageUrl[i].downloadUrl);
                      photoURL.add(newPhoto);
                    }
                    createpropertyController.newProperty.value.photos =
                        photoURL;
                    createpropertyController.uploadProperty();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: padding_m, horizontal: padding_xm),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[850]),
                    child: Text(
                      "Create Property",
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
