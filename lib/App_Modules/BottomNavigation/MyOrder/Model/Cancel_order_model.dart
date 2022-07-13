class CancelOrderModel {
  int? success;
  String? message;
  Data? data;

  CancelOrderModel({this.success, this.message, this.data});

  CancelOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CancelData>? cancelData;
  String? orderId;

  Data({this.cancelData, this.orderId});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cancelData'] != null) {
      cancelData = <CancelData>[];
      json['cancelData'].forEach((v) {
        cancelData!.add(new CancelData.fromJson(v));
      });
    }
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cancelData != null) {
      data['cancelData'] = this.cancelData!.map((v) => v.toJson()).toList();
    }
    data['order_id'] = this.orderId;
    return data;
  }
}

class CancelData {
  int? id;
  String? name;

  CancelData({this.id, this.name});

  CancelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
