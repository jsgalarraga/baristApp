// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coffee _$CoffeeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Coffee',
      json,
      ($checkedConvert) {
        final val = Coffee(
          imageUrl: $checkedConvert('image_url', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'imageUrl': 'image_url'},
    );

Map<String, dynamic> _$CoffeeToJson(Coffee instance) => <String, dynamic>{
      'image_url': instance.imageUrl,
    };
