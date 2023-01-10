// ignore_for_file: prefer_const_constructors
import 'package:image_saver_wrapper/image_saver_wrapper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockImageSaverWrapper extends Mock implements ImageSaverWrapper {}

void main() {
  group('ImageSaverRepository', () {
    late ImageSaverWrapper imageSaverRepository;

    setUp(() {
      imageSaverRepository = MockImageSaverWrapper();
    });

    group('constructor', () {
      test('builds correctly', () {
        expect(ImageSaverWrapper(), isNotNull);
      });
    });

    group('saveImageFromUrl', () {
      const imageUrl = 'mockedUrl';

      test('exists', () async {
        try {
          await imageSaverRepository.saveImageFromUrl(imageUrl);
        } catch (_) {}
        verify(() => imageSaverRepository.saveImageFromUrl(imageUrl)).called(1);
      });
    });

    group('isPhotosPermissionDenied', () {
      test('exists', () async {
        try {
          await imageSaverRepository.isPhotosPermissionDenied();
        } catch (_) {}
        verify(() => imageSaverRepository.isPhotosPermissionDenied()).called(1);
      });
    });

    group('isPhotosPermissionPermanentlyDenied', () {
      test('exists', () async {
        try {
          await imageSaverRepository.isPhotosPermissionPermanentlyDenied();
        } catch (_) {}
        verify(
          () => imageSaverRepository.isPhotosPermissionPermanentlyDenied(),
        ).called(1);
      });
    });
  });
}
