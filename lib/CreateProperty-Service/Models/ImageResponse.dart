class ImageResponse {
  String? status;
  String? name;
  String? downloadUrl;

  ImageResponse({this.status, this.name, this.downloadUrl});

  ImageResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    downloadUrl = json['downloadUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['name'] = this.name;
    data['downloadUrl'] = this.downloadUrl;
    return data;
  }
}
