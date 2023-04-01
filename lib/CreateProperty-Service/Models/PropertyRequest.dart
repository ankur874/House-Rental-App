class PropertyRequest {
  String? title;
  String? city;
  String? userId;
  String? country;
  int? bedrooms;
  int? bathrooms;
  int? kitchens;
  int? infants;
  int? adults;
  int? children;
  int? totalArea;
  String? neighbourhoodDetail;
  int? totalPrice;
  String? rentOrBuy;
  String? rentStartDate;
  String? rentEndDate;
  String? propertyType;
  List<Photos>? photos;
  List<String>? facilities;

  PropertyRequest(
      {this.title,
      this.city,
      this.userId,
      this.country,
      this.bedrooms,
      this.bathrooms,
      this.kitchens,
      this.infants,
      this.adults,
      this.children,
      this.totalArea,
      this.neighbourhoodDetail,
      this.totalPrice,
      this.rentOrBuy,
      this.rentStartDate,
      this.rentEndDate,
      this.propertyType,
      this.photos,
      this.facilities});

  PropertyRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    city = json['city'];
    userId = json['user_id'];
    country = json['country'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    kitchens = json['kitchens'];
    infants = json['infants'];
    adults = json['adults'];
    children = json['children'];
    totalArea = json['total_area'];
    neighbourhoodDetail = json['neighbourhood_detail'];
    totalPrice = json['total_price'];
    rentOrBuy = json['rentOrBuy'];
    rentStartDate = json['rent_start_date'];
    rentEndDate = json['rent_end_date'];
    propertyType = json['property_type'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    facilities = json['facilities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['city'] = this.city;
    data['user_id'] = this.userId;
    data['country'] = this.country;
    data['bedrooms'] = this.bedrooms;
    data['bathrooms'] = this.bathrooms;
    data['kitchens'] = this.kitchens;
    data['infants'] = this.infants;
    data['adults'] = this.adults;
    data['children'] = this.children;
    data['total_area'] = this.totalArea;
    data['neighbourhood_detail'] = this.neighbourhoodDetail;
    data['total_price'] = this.totalPrice;
    data['rentOrBuy'] = this.rentOrBuy;
    data['rent_start_date'] = this.rentStartDate;
    data['rent_end_date'] = this.rentEndDate;
    data['property_type'] = this.propertyType;
    if (this.photos != null) {
      data['photos'] = this.photos?.map((v) => v.toJson()).toList();
    }
    data['facilities'] = this.facilities;
    return data;
  }
}

class Photos {
  String? url;

  Photos({this.url});

  Photos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
