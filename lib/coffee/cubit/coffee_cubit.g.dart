// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeState _$CoffeeStateFromJson(Map<String, dynamic> json) => CoffeeState(
      status: $enumDecodeNullable(_$CoffeeStatusEnumMap, json['status']) ??
          CoffeeStatus.initial,
      coffee: json['coffee'] == null
          ? null
          : Coffee.fromJson(json['coffee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoffeeStateToJson(CoffeeState instance) =>
    <String, dynamic>{
      'status': _$CoffeeStatusEnumMap[instance.status]!,
      'coffee': instance.coffee,
    };

const _$CoffeeStatusEnumMap = {
  CoffeeStatus.initial: 'initial',
  CoffeeStatus.loading: 'loading',
  CoffeeStatus.success: 'success',
  CoffeeStatus.failure: 'failure',
};
