import 'package:json_annotation/json_annotation.dart';
part 'Drinks_item_model.g.dart';
@JsonSerializable()
class DrinksItemModel {
  DrinksItemModel({
    required this.strDrink,
    required this.strCategory,
    required this.strAlcoholic,
    required this.strInstructions,
    required this.strDrinkThumb,
  });

  var strDrink;
  var strCategory;
  var strAlcoholic;
  var strInstructions;
  var strDrinkThumb;

  factory DrinksItemModel.fromJson(Map<String,dynamic> data) => _$DrinksItemModelFromJson(data);
  Map<String, dynamic> toJson() => _$DrinksItemModelToJson(this);

}
