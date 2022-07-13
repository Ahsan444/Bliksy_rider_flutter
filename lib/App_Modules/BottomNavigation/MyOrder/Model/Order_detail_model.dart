
class OrderDetailModel {
  int? success;
  String? message;
  Data? data;

  OrderDetailModel({this.success, this.message, this.data});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? orderNo;
  String? orderAmount;
  int? orderType;
  int? pickupFrom;
  String? cusName;
  String? cusPhone;
  String? cusAddress;
  String? dLatitude;
  String? dLongitude;
  String? deliveryInstruction;
  String? deliveryProof;
  int? driverId;
  Null driverEarning;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.orderNo,
        this.orderAmount,
        this.orderType,
        this.pickupFrom,
        this.cusName,
        this.cusPhone,
        this.cusAddress,
        this.dLatitude,
        this.dLongitude,
        this.deliveryInstruction,
        this.deliveryProof,
        this.driverId,
        this.driverEarning,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    orderAmount = json['order_amount'];
    orderType = json['order_type'];
    pickupFrom = json['pickup_from'];
    cusName = json['cus_name'];
    cusPhone = json['cus_phone'];
    cusAddress = json['cus_address'];
    dLatitude = json['d_latitude'];
    dLongitude = json['d_longitude'];
    deliveryInstruction = json['delivery_instruction'];
    deliveryProof = json['delivery_proof'];
    driverId = json['driver_id'];
    driverEarning = json['driver_earning'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['order_amount'] = this.orderAmount;
    data['order_type'] = this.orderType;
    data['pickup_from'] = this.pickupFrom;
    data['cus_name'] = this.cusName;
    data['cus_phone'] = this.cusPhone;
    data['cus_address'] = this.cusAddress;
    data['d_latitude'] = this.dLatitude;
    data['d_longitude'] = this.dLongitude;
    data['delivery_instruction'] = this.deliveryInstruction;
    data['delivery_proof'] = this.deliveryProof;
    data['driver_id'] = this.driverId;
    data['driver_earning'] = this.driverEarning;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
