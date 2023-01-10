// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_saver_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSaverState _$ImageSaverStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ImageSaverState',
      json,
      ($checkedConvert) {
        final val = ImageSaverState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$ImageSaverStatusEnumMap, v) ??
                  ImageSaverStatus.initial),
        );
        return val;
      },
    );

Map<String, dynamic> _$ImageSaverStateToJson(ImageSaverState instance) =>
    <String, dynamic>{
      'status': _$ImageSaverStatusEnumMap[instance.status]!,
    };

const _$ImageSaverStatusEnumMap = {
  ImageSaverStatus.initial: 'initial',
  ImageSaverStatus.loading: 'loading',
  ImageSaverStatus.success: 'success',
  ImageSaverStatus.failure: 'failure',
};
