class GetUserData {
  String? message;
  String? status;
  Data? data;

  GetUserData({this.message, this.status, this.data});

  GetUserData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? doctorName;
  String? email;
  String? doctorPhone;
  String? authId;
  String? gender;
  String? phone;
  String? name;
  String? age;
  String? medication;
  List<Predicted>? predicted;

  Data(
      {this.doctorName,
        this.email,
        this.doctorPhone,
        this.authId,
        this.gender,
        this.phone,
        this.name,
        this.age,
        this.medication,
        this.predicted});

  Data.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctorName'];
    email = json['email'];
    doctorPhone = json['doctorPhone'];
    authId = json['authId'];
    gender = json['gender'];
    phone = json['phone'];
    name = json['name'];
    age = json['age'];
    medication = json['medication'];
    if (json['predicted'] != null) {
      predicted = <Predicted>[];
      json['predicted'].forEach((v) {
        predicted!.add(new Predicted.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctorName'] = this.doctorName;
    data['email'] = this.email;
    data['doctorPhone'] = this.doctorPhone;
    data['authId'] = this.authId;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['age'] = this.age;
    data['medication'] = this.medication;
    if (this.predicted != null) {
      data['predicted'] = this.predicted!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Predicted {
  double? heartRate;
  String? createdAt;

  Predicted({this.heartRate, this.createdAt});

  Predicted.fromJson(Map<String, dynamic> json) {
    heartRate = json['heart_rate'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heart_rate'] = this.heartRate;
    data['created_at'] = this.createdAt;
    return data;
  }
}