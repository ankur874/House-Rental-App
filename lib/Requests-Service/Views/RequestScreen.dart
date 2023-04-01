import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/Requests-Service/Controllers/RequestController.dart';
import 'package:house_rental_app/Requests-Service/Views/RequestDetailScreen.dart';
import 'package:house_rental_app/Requests-Service/Views/shared/RequestTiles.dart';
import 'package:house_rental_app/Requests-Service/Views/shared/Search.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RequestController requestController = Get.put(RequestController());
    requestController.getUser();
    print("------------------");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          " Requests",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Obx(
          () => requestController.isLoading.value == true
              ? CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      // const SizedBox(
                      //   height: 70,
                      // ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: Search()),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: requestController.userRequests.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Get.to(RequestDetailScreen(
                                          request: requestController
                                              .userRequests[index]));
                                    },
                                    child: RequestTile(
                                        request: requestController
                                            .userRequests[index]));
                              }))
                    ]),
        ),
      ),
    );
  }
}
