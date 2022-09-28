
import 'package:super_flutter/super_flutter.dart';

class SliderImages extends BaseModel {
  String? id;
  String? type;
  String? typeId;
  String? image;
  String? dateAdded;

  SliderImages({
    this.id,
    this.type,
    this.typeId,
    this.image,
    this.dateAdded,
  });

  factory SliderImages.fromMap(Map<String, dynamic> map) => SliderImages(
        id: map['id'],
        type: map['type'],
        typeId: map['type_id'].toString(),
        image: map['image'],
        dateAdded: map['date_added'],
      );

  @override
  BaseModel fromJson(Map<String, dynamic> element) => SliderImages.fromMap(element);

  @override
  List<BaseModel> fromJsonList(List elements) => elements.map((item) => SliderImages.fromMap(item)).toList();

  @override
  Map<String, dynamic> toJson() => {};
}
