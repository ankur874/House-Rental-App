import 'package:house_rental_app/Property-Service/PropertyResponse.dart';

class RequestResponse {
  String? status;
  List<Request>? request;

  RequestResponse({this.status, this.request});

  RequestResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['request'] != null) {
      request = <Request>[];
      json['request'].forEach((v) {
        request?.add(new Request.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.request != null) {
      data['request'] = this.request?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Request {
  String? sId;
  String? date;
  PropertyResponse? propertyId;
  String? userId;
  bool? isPending;
  bool? isAccepted;
  String? startDate;
  String? endDate;
  int? guestCount;
  int? iV;

  Request(
      {this.sId,
      this.date,
      this.propertyId,
      this.userId,
      this.isPending,
      this.isAccepted,
      this.startDate,
      this.endDate,
      this.guestCount,
      this.iV});

  Request.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    propertyId = json['property_id'] != null
        ? new PropertyResponse.fromJson(json['property_id'])
        : null;
    userId = json['user_id'];
    isPending = json['is_pending'];
    isAccepted = json['is_accepted'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    guestCount = json['guest_count'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['date'] = this.date;
    if (this.propertyId != null) {
      data['property_id'] = this.propertyId?.toJson();
    }
    data['user_id'] = this.userId;
    data['is_pending'] = this.isPending;
    data['is_accepted'] = this.isAccepted;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['guest_count'] = this.guestCount;
    data['__v'] = this.iV;
    return data;
  }
}
