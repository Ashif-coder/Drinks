// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinksModel _$DrinksModelFromJson(Map<String, dynamic> json) => DrinksModel(
      drinks: (json['drinks'] as List<dynamic>)
          .map((e) => DrinksItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrinksModelToJson(DrinksModel instance) =>
    <String, dynamic>{
      'drinks': instance.drinks.map((e) => e.toJson()).toList(),
    };
