import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Detail&RequestService/Models/GetPropertyIDResponse.dart';
import 'package:house_rental_app/Property-Service/PropertyResponse.dart';

import 'package:http/http.dart' as http;

class PropertyController extends GetxController {
  String propertyId;
  PropertyController({required this.propertyId});
  Rx<Property> property = Property().obs;
  RxBool isLoading = false.obs;
  RxInt carouselIndex = 0.obs;
  RxString startDate = "Start Date".obs;
  RxString endDate = "End Date".obs;
  RxInt guestCount = 0.obs;
  RxInt guestLimit = 0.obs;
  final prefs = GetStorage();
  RxBool isPropRented = false.obs;
  RxBool propertyRequestPlaced = false.obs;
  @override
  void onInit() {
    super.onInit();
    getPropertyByID();
    isPropertyRented();
  }

  void getPropertyByID() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse("${BASE_URL}/api/properties/${propertyId}"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print(property.value);
    property.value = Property.fromJson(jsonDecode(response.body)["property"]);
    print(property.value.toJson());
    guestLimit.value = property.value.children! +
        property.value.adults! +
        property.value.infants!;
    isLoading.value = false;
  }

  void bookProperty() async {
    propertyRequestPlaced.value = true;
    var userId = prefs.read("user_id");
    var response = await http.post(Uri.parse(BASE_URL + CREATE_REQUEST),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "date":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "property_id": property.value.sId,
          "user_id": userId,
          "start_date": startDate.value,
          "end_date": endDate.value,
          "guest_count": guestCount.value,
          "is_pending": true,
          "is_accepted": false,
        }));
    isPropertyRented();
    propertyRequestPlaced.value = false;
    print(response.body);
  }

  void isPropertyRented() async {
    var userId = prefs.read("user_id");
    print(propertyId);
    var response =
        await http.post(Uri.parse("${BASE_URL}/api/requests/getrequest"),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, dynamic>{
              "property_id": propertyId,
              "user_id": userId,
            }));
    print("isideeeeeeee");
    if (jsonDecode(response.body)["request"].length > 0) {
      isPropRented.value = true;
    }
    print(jsonDecode(response.body)["request"]);
    // print("iusnideeee");
  }
}
