class PackageListModel {
  String? code;
  String? status;
  String? message;
  List<PackageListResponse>? response;

  PackageListModel({this.code, this.status, this.message, this.response});

  PackageListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['response'] != null) {
      response = <PackageListResponse>[];
      json['response'].forEach((v) {
        response!.add(new PackageListResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackageListResponse {
  String? title;
  String? price;
  String? desc;

  PackageListResponse({this.title, this.price, this.desc});

  PackageListResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['desc'] = this.desc;
    return data;
  }
}
