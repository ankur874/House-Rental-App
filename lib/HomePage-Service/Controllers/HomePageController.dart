import 'dart:convert';
import 'package:get/get.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/HomePage-Service/Models/HomePagePropertyResponse.dart';
import 'package:house_rental_app/Property-Service/PropertyResponse.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController {
  RxBool isLoading = false.obs;
  RxString homePageState = "RENT".obs;
  Rx<HomePagePropertyResponse> homePage = HomePagePropertyResponse().obs;
  RxList<PropertyResponse> topRated = <PropertyResponse>[].obs;
  RxList<PropertyResponse> nearYourLocation = <PropertyResponse>[].obs;
  @override
  void onInit() {
    super.onInit();
    getPropertiesByLocation();
  }

  toggleState() {
    if (homePageState.value == "RENT") {
      homePageState.value = "BUY";
    } else {
      homePageState.value = "RENT";
    }
  }

  void getPropertiesByLocation() async {
    isLoading.value = true;
    var response = await http.post(
      Uri.parse(BASE_URL + GET_PROPERTIES_NEAR_YOU_REQUEST),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body:
          jsonEncode(<String, dynamic>{"city": "Delhi", "country": "Pakistam"}),
    );
    isLoading.value = false;
    HomePagePropertyResponse data =
        HomePagePropertyResponse.fromJson(jsonDecode(response.body));
    homePage.value = data;
    nearYourLocation.value = data.nearLocation!;
    topRated.value = data.topRated!;
  }
}
