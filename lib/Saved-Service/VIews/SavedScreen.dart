import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Property-Service/PropertyCard.dart';
import 'package:house_rental_app/Saved-Service/Controllers/SavedController.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SavedController savedController = Get.put(SavedController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Saved",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Obx(
        () => savedController.isLoading == true
            ? CircularProgressIndicator()
            : Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: savedController.saved.value.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {},
                                child: Container(
                                    height: 180,
                                    margin: EdgeInsets.only(
                                        top: 30,
                                        left: 10,
                                        bottom: 10,
                                        right: 10),
                                    child: PropertyCard(
                                        property: savedController.saved[index])
                                    //todo Container to propertyCard
                                    ));
                          }))
                ],
              ),
      ),
    );
  }
}
