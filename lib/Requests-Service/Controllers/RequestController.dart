import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Profile-Service/Controllers/ProfileController.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:house_rental_app/Profile-Service/Models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../Constants.dart';
import '../Models/RequestModel.dart';

class RequestController extends GetxController {
  RxList<Request> userRequests = <Request>[].obs;
  RxBool isLoading = false.obs;
  var user = UserModel().obs;
  RxBool isHost = false.obs;

  final prefs = GetStorage();

  void getUser() async {
    var userId = prefs.read("user_id");
    print(userId);
    // "/api/users/profile/id"
    var response = await http.get(
      Uri.parse("$BASE_URL/api/users/profile/$userId"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    isHost.value = jsonDecode(response.body)["user"]["is_host"];
    if (isHost.value == true) {
      getHostRequest();
    } else {
      getUserRequests();
    }
  }

  void getUserRequests() async {
    isLoading.value = true;
    var userId = prefs.read("user_id");
    var response = await http.get(
      Uri.parse("${BASE_URL}/api/requests/getuserrequest/${userId}"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    RequestResponse requestResponse =
        RequestResponse.fromJson(jsonDecode(response.body));
    userRequests.value = requestResponse.request!;
    isLoading.value = false;
    print("dffdffffffff");
    print(isHost.value);
  }

  void getHostRequest() async {
    isLoading.value = true;
    var userId = prefs.read("user_id");
    var response = await http.get(
      Uri.parse("${BASE_URL}/api/requests/gethostrequest/${userId}"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    RequestResponse requestResponse =
        RequestResponse.fromJson(jsonDecode(response.body));
    userRequests.value = requestResponse.request!;
    isLoading.value = false;
    print("dffdffffffff");
    print(isHost.value);
  }

  @override
  void onInit() {
    super.onInit();
    // getUserRequests();
  }
}
