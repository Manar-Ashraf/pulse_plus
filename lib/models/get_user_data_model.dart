class GetUserData {
  String? message;
  String? status;
  Data? data;

  GetUserData({this.message, this.status, this.data});

  GetUserData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['message'] = message;
    jsonData['status'] = status;
    if (data != null) {
      jsonData['data'] = data!.toJson();
    }
    return jsonData;
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
  String? id;

  List<Predicted>? predicted;
  List<Filterd>? filterd;

  Data({
    this.doctorName,
    this.email,
    this.doctorPhone,
    this.authId,
    this.gender,
    this.phone,
    this.name,
    this.age,
    this.medication,
    this.id,
    this.predicted,
    this.filterd,
  });

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
    id = json['id'];
    if (json['predicted'] != null) {
      predicted = (json['predicted'] as List).map((v) => Predicted.fromJson(v)).toList();
    }
    if (json['filterd'] != null) {
      filterd = (json['filterd'] as List).map((v) => Filterd.fromJson(v)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['doctorName'] = doctorName;
    jsonData['email'] = email;
    jsonData['doctorPhone'] = doctorPhone;
    jsonData['authId'] = authId;
    jsonData['gender'] = gender;
    jsonData['phone'] = phone;
    jsonData['name'] = name;
    jsonData['age'] = age;
    jsonData['medication'] = medication;
    jsonData['id'] = id;
    if (predicted != null) {
      jsonData['predicted'] = predicted!.map((v) => v.toJson()).toList();
    }
    if (filterd != null) {
      jsonData['filterd'] = filterd!.map((v) => v.toJson()).toList();
    }
    return jsonData;
  }
}

class Predicted {
  String? createdAt;
  double? heartRate;

  Predicted({this.createdAt, this.heartRate});

  Predicted.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    heartRate = json['heart_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['created_at'] = createdAt;
    jsonData['heart_rate'] = heartRate;
    return jsonData;
  }
}

class Filterd {
  String? createdAt;
  double? heartRate;

  Filterd({this.createdAt, this.heartRate});

  Filterd.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    heartRate = json['heart_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['created_at'] = createdAt;
    jsonData['heart_rate'] = heartRate;
    return jsonData;
  }
}
