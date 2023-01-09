// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeState _$CoffeeStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CoffeeState',
      json,
      ($checkedConvert) {
        final val = CoffeeState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$CoffeeStatusEnumMap, v) ??
                  CoffeeStatus.initial),
          coffee: $checkedConvert(
              'coffee',
              (v) => v == null
                  ? null
                  : Coffee.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$CoffeeStateToJson(CoffeeState instance) =>
    <String, dynamic>{
      'status': _$CoffeeStatusEnumMap[instance.status]!,
      'coffee': instance.coffee.toJson(),
    };

const _$CoffeeStatusEnumMap = {
  CoffeeStatus.initial: 'initial',
  CoffeeStatus.loading: 'loading',
  CoffeeStatus.success: 'success',
  CoffeeStatus.failure: 'failure',
};
