import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image_saver_wrapper/image_saver_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_saver_cubit.g.dart';
part 'image_saver_state.dart';

class ImageSaverCubit extends Cubit<ImageSaverState> {
  ImageSaverCubit(this._imageSaver) : super(const ImageSaverState());

  final ImageSaverWrapper _imageSaver;

  Future<void> saveImageFromUrl(String imageUrl) async {
    emit(state.copyWith(status: ImageSaverStatus.loading));

    try {
      if (await _imageSaver.isPhotosPermissionPermanentlyDenied()) {
        emit(state.copyWith(status: ImageSaverStatus.missingPermissions));
        return;
      }
      final success = await _imageSaver.saveImageFromUrl(imageUrl);
      if (success ?? false) {
        emit(state.copyWith(status: ImageSaverStatus.success));
        return;
      }
      emit(state.copyWith(status: ImageSaverStatus.failure));
    } on Exception {
      emit(state.copyWith(status: ImageSaverStatus.failure));
    }
  }

  ImageSaverState fromJson(Map<String, dynamic> json) =>
      ImageSaverState.fromJson(json);

  Map<String, dynamic> toJson(ImageSaverState state) => state.toJson();
}
