import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_rental_app/CreateProperty-Service/Controllers/CreatePropertyController.dart';

class CreatePropertyAddRemove extends StatelessWidget {
  String title;
  RxInt number;

  CreatePropertyAddRemove({required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    CreatepropertyController createpropertyController = Get.find();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Obx(
        () => Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  number.value--;
                },
                child: Icon(Icons.remove_circle_outline_sharp)),
            SizedBox(
              width: 7,
            ),
            Text(
              number.value.toString(),
              style: TextStyle(fontSize: 19),
            ),
            SizedBox(
              width: 7,
            ),
            GestureDetector(
              onTap: () {
                number.value++;
              },
              child: Icon(
                Icons.add_circle_outline_sharp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
