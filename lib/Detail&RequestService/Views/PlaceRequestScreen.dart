import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Detail&RequestService/Components/PlaceRequestScreenInput.dart';
import 'package:house_rental_app/Detail&RequestService/Components/PlaceRequestScreenPrice.dart';
import 'package:house_rental_app/Detail&RequestService/Controllers/PropertyController.dart';

import '../../Property-Service/PropertyCard.dart';
// import 'package:house_rental_app/HomePage-Service/Components/PropertyCard.dart';

class PlacerequestScreen extends StatelessWidget {
  const PlacerequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyController propertyController = Get.find();
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Rent booking",
          style: TextStyle(
            color: foundation_dark,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Display',
            fontStyle: FontStyle.normal,
            fontSize: font_xxm,
          ),
        ),
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
            // height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: padding_m),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (propertyController.isPropRented.value == false &&
                        propertyController.propertyRequestPlaced.value == true)
                    ? CircularProgressIndicator()
                    : (propertyController.isPropRented.value == true &&
                            propertyController.propertyRequestPlaced.value ==
                                false)
                        ? Image.asset("assets/gif/success.gif")
                        : Column(
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              PlaceRequestScreenInput(),
                              SizedBox(
                                height: 24,
                              ),
                              PlaceRequestScreenPrice(),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                SizedBox(
                  height: 20,
                ),
                (propertyController.isPropRented.value == true &&
                        propertyController.propertyRequestPlaced.value == false)
                    ? Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "Booking request placed ",
                          style: TextStyle(
                            color: foundation_white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SF Pro Display',
                            fontStyle: FontStyle.normal,
                            fontSize: font_m,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(54)),
                      )
                    : GestureDetector(
                        onTap: () {
                          propertyController.bookProperty();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 1.2,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Place booking request",
                            style: TextStyle(
                              color: foundation_white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SF Pro Display',
                              fontStyle: FontStyle.normal,
                              fontSize: font_m,
                            ),
                          ),
                          decoration: BoxDecoration(
                              gradient: buttonLinearGradient,
                              borderRadius: BorderRadius.circular(54)),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
