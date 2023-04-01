import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Components/TextFeildContainer.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/CreateProperty-Service/Components/CreatePropertyButton.dart';

import 'package:house_rental_app/CreateProperty-Service/Components/CreatePropertyBuyRentTab.dart';

import 'package:house_rental_app/CreateProperty-Service/Components/CreatePropertyHeading.dart';

import '../Controllers/CreatePropertyController.dart';
import '../Components/CreatePropertyAddRemove.dart';
import 'CreateProperty2.dart';

class CreateProperty extends StatelessWidget {
  const CreateProperty({super.key});

  @override
  Widget build(BuildContext context) {
    CreatepropertyController createpropertyController =
        Get.put(CreatepropertyController());
    TextEditingController titleController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController neighbourController = TextEditingController();
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFeildContainer(
                    controller: titleController,
                    text: "Property Title",
                    icon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.add_task)),
                    obscureText: false),
                Container(
                  // width: MediaQuery.of(context).size.width / 2,
                  child: TextFeildContainer(
                      controller: cityController,
                      text: " City ",
                      icon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(Icons.location_city)),
                      obscureText: false),
                ),
                Container(
                  // width: MediasQuery.of(context).size.width / 2,
                  child: TextFeildContainer(
                      controller: countryController,
                      text: " Country ",
                      icon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(Icons.map)),
                      obscureText: false),
                ),
                TextFeildContainer(
                    controller: neighbourController,
                    text: "About Neighbouhood ",
                    icon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.near_me)),
                    obscureText: false),
                CreatePropertyBuyRentTab(),
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
                          style:
                              TextStyle(color: Colors.grey[850], fontSize: 17),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          createpropertyController.newProperty.value.title =
                              titleController.text;
                          createpropertyController.newProperty.value.city =
                              cityController.text;
                          createpropertyController.newProperty.value.country =
                              countryController.text;
                          createpropertyController.newProperty.value
                              .neighbourhoodDetail = neighbourController.text;
                          createpropertyController.newProperty.value.rentOrBuy =
                              createpropertyController.propertyState.value;
                          Get.to(CreateProperty2());
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
                SizedBox(
                  height: 20,
                )
              ]),
        ),
      ),
    );
  }
}
