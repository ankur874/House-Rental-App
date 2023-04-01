import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:house_rental_app/Profile-Service/Models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../Constants.dart';

class ProfileController extends GetxController {
  Rx<ImagePicker> imagePicker = ImagePicker().obs;
  RxString imagePath = "".obs;

  final prefs = GetStorage();
  RxBool isLoading = false.obs;
  var user = UserModel().obs;
  RxInt gender = 0.obs;
  RxBool married = false.obs;
  RxBool phoneTapped = false.obs;
  RxBool ageTapped = false.obs;

  void changeGender(int val) {
    gender.value = val;
  }

  void changeMarried(bool val) {
    married.value = val;
  }

  void phoneTap(bool val) => phoneTapped.value = val;

  void ageTap(bool val) => ageTapped.value = val;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getUser();
  }

  void getUser() async {
    isLoading.value = true;
    var userId = prefs.read("user_id");
    print(userId);
    // "/api/users/profile/id"
    var response = await http.get(
      Uri.parse("$BASE_URL/api/users/profile/$userId"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    UserModel currUser = UserModel.fromJson(jsonDecode(response.body)["user"]);
    user.value = currUser;
    isLoading.value = false;
  }

  void editUserDetails(int phone, int age) async {
    isLoading.value = true;
    var userId = prefs.read("user_id");
    var response = await http.post(
      Uri.parse("$BASE_URL/api/users/profile/$userId"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "phone": phone,
        "age": age,
        "gender": gender.value == 0 ? "Male" : "Female",
        "marital_status": married.value,
      }),
    );
    // UserModel currUser = UserModel.fromJson(jsonDecode(response.body)["data"]);
    // user.value = currUser;
    print(jsonDecode(response.body)["data"]);
    getUser();
    isLoading.value = false;
  }

  void switchUserState() async {
    var userId = prefs.read("user_id");
    var response = await http.post(
      Uri.parse("$BASE_URL/api/users/profile/$userId"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{"is_host": user.value.isHost}),
    );
    print(jsonDecode(response.body)["data"]);
    getUser();
  }

  openImage() async {
    try {
      var pickedFile =
          await imagePicker.value.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imagePath.value = pickedFile.path;
        print(imagePath);
        XFile file = XFile(imagePath.value.toString());

        return 1;
      } else {
        print("no image selected");
        return -1;
      }
    } catch (e) {
      print("error in image file");
      print(e);
      return -1;
    }
  }
}
