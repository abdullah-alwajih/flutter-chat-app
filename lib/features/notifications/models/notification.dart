import 'package:super_flutter/super_flutter.dart';

class NotificationModel extends BaseModel {
  String? id, title, desc, image, typeId, date;

  NotificationModel(
      {this.id, this.title, this.desc, this.image, this.typeId, this.date});

  factory NotificationModel.fromMap(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'],
        title: json['title'],
        desc: json['message'],
        image: json['image'],
        typeId: json['type_id'],
      );

  @override
  BaseModel fromJson(Map<String, dynamic> element) =>
      NotificationModel.fromMap(element);

  @override
  List<BaseModel> fromJsonList(List elements) =>
      elements.map((item) => NotificationModel.fromMap(item)).toList();
}
