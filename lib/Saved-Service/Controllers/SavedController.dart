import 'dart:collection';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:house_rental_app/Property-Service/PropertyResponse.dart';
import 'package:http/http.dart' as http;
import '../../Constants.dart';

class SavedController extends GetxController {
  final prefs = GetStorage();
  RxList<PropertyResponse> saved = <PropertyResponse>[].obs;
  RxBool isAddingToFav = false.obs;
  RxBool isLoading = false.obs;
  // final saved = HashSet<String>();

  @override
  void onInit() {
    super.onInit();
    getSavedList();
  }

  void addToFav(String property_id) async {
    var userId = prefs.read("user_id");
    print(userId);
    isAddingToFav.value = true;
    var response = await http
        .post(
      Uri.parse(BASE_URL + SAVE_PROPERTY),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "user_id": userId,
        "property_id": property_id,
      }),
    )
        .whenComplete(() {
      isAddingToFav.value = false;
      getSavedList();
      saved.refresh();

      update();
    });

    print(response.body);
  }

  void removeToFav(String property_id) async {
    var userId = prefs.read("user_id");
    isAddingToFav.value = true;
    var response = await http
        .post(
      Uri.parse(BASE_URL + UNSAVE_PROPERTY),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "user_id": userId,
        "property_id": property_id,
      }),
    )
        .whenComplete(() {
      isAddingToFav.value = false;
      getSavedList();
      saved.refresh();
    });

    print(response.body);
  }

  bool isPresentInSaved(String property_id) {
    print("ffffffffff");
    for (int i = 0; i < saved.length; i++) {
      print(saved[i].sId);
      print(property_id);
      if (property_id == saved[i].sId) {
        return true;
      }
    }
    return false;
  }

  void getSavedList() async {
    isLoading.value = true;
    var userId = prefs.read("user_id");
    var response = await http.get(
      Uri.parse("$BASE_URL/api/users/getSaved/$userId"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    // print("thuis");
    // PropertyResponse.fromJson(jsonDecode(response.body)["savedList"]);
    List data = jsonDecode(response.body)["savedList"];
    // print(data);
    saved.value = data.map((e) {
      return PropertyResponse.fromJson(e);
    }).toList();

    saved.refresh();
    isLoading.value = false;
    // print(saved.value[0].toJson());
    // print("thuis");
  }
}
