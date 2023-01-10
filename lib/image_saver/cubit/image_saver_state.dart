part of 'image_saver_cubit.dart';

enum ImageSaverStatus { initial, loading, success, failure, missingPermissions }

extension ImageSaverStatusX on ImageSaverStatus {
  bool get isInitial => this == ImageSaverStatus.initial;
  bool get isLoading => this == ImageSaverStatus.loading;
  bool get isSuccess => this == ImageSaverStatus.success;
  bool get isFailure => this == ImageSaverStatus.failure;
  bool get isMissingPermissions => this == ImageSaverStatus.missingPermissions;
}

@JsonSerializable()
class ImageSaverState extends Equatable {
  const ImageSaverState({
    this.status = ImageSaverStatus.initial,
  });

  factory ImageSaverState.fromJson(Map<String, dynamic> json) =>
      _$ImageSaverStateFromJson(json);

  final ImageSaverStatus status;

  ImageSaverState copyWith({
    ImageSaverStatus? status,
  }) {
    return ImageSaverState(
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() => _$ImageSaverStateToJson(this);

  @override
  List<Object?> get props => [status];
}
