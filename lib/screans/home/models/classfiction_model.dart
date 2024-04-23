class ClassfictionModel {
  Data? data;
  String? message;
  bool? status;

  ClassfictionModel({this.data, this.message, this.status});

  ClassfictionModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  double? confidence;
  String? description;
  String? image;
  String? predictions;
  String? sunlight;
  String? temperature;
  String? watering;
  String? reportpath;

  Data.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence']?.toDouble();
    description = json['discription'];
    image = json['image'];
    predictions = json['predictions'];
    sunlight = json['sunlight'];
    temperature = json['temperature'];
    watering = json['watering'];
    reportpath = json['report_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confidence'] = confidence;
    data['description'] = description;
    data['image'] = image;
    data['predictions'] = predictions;
    data['sunlight'] = sunlight;
    data['temperature'] = temperature;
    data['watering'] = watering;
    data['report_path'] = reportpath;
    return data;
  }
}
