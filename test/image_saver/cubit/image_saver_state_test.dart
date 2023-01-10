import 'package:coffee_app/image_saver/cubit/image_saver_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ImageSaverStatusX', () {
    test('returns correct values for ImageSaverStatus.initial', () {
      const status = ImageSaverStatus.initial;
      expect(status.isInitial, isTrue);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
      expect(status.isMissingPermissions, isFalse);
    });

    test('returns correct values for ImageSaverStatus.loading', () {
      const status = ImageSaverStatus.loading;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
      expect(status.isMissingPermissions, isFalse);
    });

    test('returns correct values for ImageSaverStatus.success', () {
      const status = ImageSaverStatus.success;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isFailure, isFalse);
      expect(status.isMissingPermissions, isFalse);
    });

    test('returns correct values for ImageSaverStatus.failure', () {
      const status = ImageSaverStatus.failure;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isTrue);
      expect(status.isMissingPermissions, isFalse);
    });
    test('returns correct values for ImageSaverStatus.missingPermissions', () {
      const status = ImageSaverStatus.missingPermissions;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
      expect(status.isMissingPermissions, isTrue);
    });
  });
}
