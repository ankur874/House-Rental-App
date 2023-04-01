import '../../Property-Service/PropertyResponse.dart';

class HomePagePropertyResponse {
  String? status;
  List<PropertyResponse>? nearLocation;
  List<PropertyResponse>? topRated;
  String? title1;
  String? title2;
  String? title3;
  String? title4;
  String? subtitle1;
  String? subtitle2;
  String? subtitle3;

  HomePagePropertyResponse(
      {this.status,
      this.nearLocation,
      this.topRated,
      this.title1,
      this.title2,
      this.title3,
      this.title4,
      this.subtitle1,
      this.subtitle2,
      this.subtitle3});

  HomePagePropertyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['nearLocation'] != null) {
      nearLocation = <PropertyResponse>[];
      json['nearLocation'].forEach((v) {
        nearLocation?.add(PropertyResponse.fromJson(v));
      });
    }
    if (json['topRated'] != null) {
      topRated = <PropertyResponse>[];
      json['topRated'].forEach((v) {
        topRated?.add(new PropertyResponse.fromJson(v));
      });
    }
    title1 = json['title1'];
    title2 = json['title2'];
    title3 = json['title3'];
    title4 = json['title4'];
    subtitle1 = json['subtitle1'];
    subtitle2 = json['subtitle2'];
    subtitle3 = json['subtitle3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.nearLocation != null) {
      data['nearLocation'] = this.nearLocation?.map((v) => v.toJson()).toList();
    }
    if (this.topRated != null) {
      data['topRated'] = this.topRated?.map((v) => v.toJson()).toList();
    }
    data['title1'] = this.title1;
    data['title2'] = this.title2;
    data['title3'] = this.title3;
    data['title4'] = this.title4;
    data['subtitle1'] = this.subtitle1;
    data['subtitle2'] = this.subtitle2;
    data['subtitle3'] = this.subtitle3;
    return data;
  }
}
