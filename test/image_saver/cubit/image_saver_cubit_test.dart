// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_app/image_saver/cubit/image_saver_cubit.dart';
import 'package:image_saver_wrapper/image_saver_wrapper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../helpers/hydrated_bloc.dart';

const imageUrl = 'mockedUrl';

class MockImageSaver extends Mock implements ImageSaverWrapper {}

void main() {
  initHydratedStorage();

  group('ImageSaverCubit', () {
    late ImageSaverWrapper imageSaver;
    late ImageSaverCubit imageSaverCubit;

    setUp(() async {
      imageSaver = MockImageSaver();
      imageSaverCubit = ImageSaverCubit(imageSaver);
    });

    test('initial state is correct', () {
      final imageSaverCubit = ImageSaverCubit(imageSaver);
      expect(imageSaverCubit.state, ImageSaverState());
    });

    group('toJson/fromJson', () {
      test('work correctly', () {
        final imageSaverCubit = ImageSaverCubit(imageSaver);
        expect(
          imageSaverCubit.fromJson(
            imageSaverCubit.toJson(imageSaverCubit.state),
          ),
          imageSaverCubit.state,
        );
      });
    });

    group('saveImageFromUrl', () {
      blocTest<ImageSaverCubit, ImageSaverState>(
        'calls saveImageFromUrl correctly when has permissions',
        setUp: () {
          when(
            () => imageSaver.saveImageFromUrl(any()),
          ).thenAnswer((_) async => true);
          when(
            () => imageSaver.isPhotosPermissionPermanentlyDenied(),
          ).thenAnswer((_) async => false);
        },
        build: () => imageSaverCubit,
        act: (cubit) => cubit.saveImageFromUrl(imageUrl),
        verify: (_) {
          verify(() => imageSaver.saveImageFromUrl(imageUrl)).called(1);
        },
      );

      blocTest<ImageSaverCubit, ImageSaverState>(
        'emits [loading, failure] when saveImageFromUrl throws',
        setUp: () {
          when(
            () => imageSaver.saveImageFromUrl(any()),
          ).thenThrow(Exception());
          when(
            () => imageSaver.isPhotosPermissionPermanentlyDenied(),
          ).thenAnswer((_) async => false);
        },
        build: () => imageSaverCubit,
        act: (cubit) => cubit.saveImageFromUrl(imageUrl),
        expect: () => <ImageSaverState>[
          ImageSaverState(status: ImageSaverStatus.loading),
          ImageSaverState(status: ImageSaverStatus.failure),
        ],
      );

      blocTest<ImageSaverCubit, ImageSaverState>(
        'emits [loading, missingPermissions] when photos permission '
        'not granted',
        setUp: () {
          when(
            () => imageSaver.saveImageFromUrl(any()),
          ).thenAnswer((_) async => null);
          when(
            () => imageSaver.isPhotosPermissionPermanentlyDenied(),
          ).thenAnswer((_) async => true);
        },
        build: () => imageSaverCubit,
        act: (cubit) => cubit.saveImageFromUrl(imageUrl),
        expect: () => <ImageSaverState>[
          ImageSaverState(status: ImageSaverStatus.loading),
          ImageSaverState(status: ImageSaverStatus.missingPermissions),
        ],
      );
      blocTest<ImageSaverCubit, ImageSaverState>(
        'emits [loading, failure] when saveImageFromUrl returns false',
        setUp: () {
          when(
            () => imageSaver.saveImageFromUrl(any()),
          ).thenAnswer((_) async => false);
          when(
            () => imageSaver.isPhotosPermissionPermanentlyDenied(),
          ).thenAnswer((_) async => false);
        },
        build: () => imageSaverCubit,
        act: (cubit) => cubit.saveImageFromUrl(imageUrl),
        expect: () => <ImageSaverState>[
          ImageSaverState(status: ImageSaverStatus.loading),
          ImageSaverState(status: ImageSaverStatus.failure),
        ],
      );

      blocTest<ImageSaverCubit, ImageSaverState>(
        'emits [loading, success] when saveImageFromUrl returns correctly',
        setUp: () {
          when(
            () => imageSaver.saveImageFromUrl(any()),
          ).thenAnswer((_) async => true);
          when(
            () => imageSaver.isPhotosPermissionPermanentlyDenied(),
          ).thenAnswer((_) async => false);
        },
        build: () => imageSaverCubit,
        act: (cubit) => cubit.saveImageFromUrl(imageUrl),
        expect: () => <dynamic>[
          ImageSaverState(status: ImageSaverStatus.loading),
          ImageSaverState(status: ImageSaverStatus.success),
        ],
      );
    });
  });
}
