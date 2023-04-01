import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/CreateProperty-Service/Models/ImageResponse.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http_parser/http_parser.dart';

import '../Models/PropertyRequest.dart';

class CreatepropertyController extends GetxController {
  RxString propertyState = "RENT".obs;
  RxInt propertyTypeIndex = 0.obs;
  Rx<PropertyRequest> newProperty = PropertyRequest().obs;
  RxInt bedrooms = 0.obs;
  RxInt bathrooms = 0.obs;
  RxInt kitchens = 0.obs;
  RxInt adults = 0.obs;
  RxInt children = 0.obs;
  RxInt infants = 0.obs;
  RxString startDate = "Start Date".obs;
  RxString endDate = "End Date".obs;
  RxDouble price = 1000.0.obs;
  RxList<bool> isSelected = RxList.filled(13, false);
  Rx<ImagePicker> imagePicker = ImagePicker().obs;
  RxString imagePath = "".obs;
  RxList<ImageResponse> imageUrl = <ImageResponse>[].obs;
  RxBool imageLoading = false.obs;
  RxList<String> facilities = <String>[].obs;
  final prefs = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  addRoom(String title) {
    switch (title) {
      case "Bedrooms":
        newProperty.value.bedrooms = newProperty.value.bedrooms! + 1;
        break;
      case "Bathrooms":
        newProperty.value.bathrooms = newProperty.value.bathrooms! + 1;
        break;
      case "Kitchens":
        newProperty.value.kitchens = newProperty.value.kitchens! + 1;
        break;
      case "Adults":
        newProperty.value.adults = newProperty.value.adults! + 1;
        break;
      case "Children":
        newProperty.value.children = newProperty.value.children! + 1;
        break;
      case "Infants":
        newProperty.value.infants = newProperty.value.infants! + 1;
        break;
    }
  }

  removeRoom(String title) {
    switch (title) {
      case "Bedrooms":
        newProperty.value.bedrooms = newProperty.value.bedrooms! - 1;
        break;
      case "Bathrooms":
        newProperty.value.bathrooms = newProperty.value.bathrooms! - 1;
        break;
      case "Kitchens":
        newProperty.value.kitchens = newProperty.value.kitchens! - 1;
        break;
      case "Adults":
        newProperty.value.adults = newProperty.value.adults! - 1;
        break;
      case "Children":
        newProperty.value.children = newProperty.value.children! - 1;
        break;
      case "Infants":
        newProperty.value.infants = newProperty.value.infants! - 1;
        break;
    }
  }

  toggleState() {
    if (propertyState.value == "RENT") {
      propertyState.value = "BUY";
    } else {
      propertyState.value = "RENT";
    }
  }

  openImage() async {
    try {
      var pickedFile =
          await imagePicker.value.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imagePath.value = pickedFile.path;
        File file = File(imagePath.value.toString());
        imageLoading.value = true;
        var stream = new http.ByteStream(file.openRead());
        stream.cast();
        var length = await file.length();

        var uri =
            Uri.parse("https://house-rental-backend.vercel.app/api/uploads");

        var request = http.MultipartRequest("POST", uri);
        var multipartFile = http.MultipartFile('image', stream, length,
            filename: basename(file.path),
            contentType: MediaType('image', "png"));

        request.files.add(multipartFile);
        http.Response response =
            await http.Response.fromStream(await request.send());

        ImageResponse data = ImageResponse.fromJson(jsonDecode(response.body));
        imageUrl.add(data);
        imageLoading.value = false;
      } else {
        print("no image selected");
      }
    } catch (e) {
      print("error in image file");
      print(e);
    }
  }

  void uploadProperty() async {
    var userId = prefs.read("user_id");
    newProperty.value.userId = userId;
    var req = newProperty.value.toJson();
    print(req);
    var response = await http.post(Uri.parse(BASE_URL + UPLOAD_PROPERTY),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(req));
    print(response.body);
  }
  // void getPropertiesNearYou() async {
  //   var response = await http.post(
  //     Uri.parse(BASE_URL + GET_PROPERTIES_NEAR_YOU_REQUEST),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body:
  //         jsonEncode(<String, dynamic>{"city": "Delhi", "country": "Pakistam"}),
  //   );

  //   // print(jsonDecode(response.body)["data"]);
  //   Data data = Data.fromJson(jsonDecode(response.body)["data"]);
  // }
}
