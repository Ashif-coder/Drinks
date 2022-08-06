

import 'Drinks_item_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';
@JsonSerializable(explicitToJson: true)
class DrinksModel {
  DrinksModel({
    required this.drinks,
  });

  List<DrinksItemModel> drinks;

  factory DrinksModel.fromJson(Map<String,dynamic> data) => _$DrinksModelFromJson(data);
  Map<String, dynamic> toJson() => _$DrinksModelToJson(this);


}
