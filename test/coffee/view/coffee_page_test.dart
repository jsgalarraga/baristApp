import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_app/coffee/coffee.dart';
import 'package:coffee_app/image_saver/image_saver.dart';
import 'package:coffee_repository/coffee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_saver_wrapper/image_saver_wrapper.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/hydrated_bloc.dart';
import '../../image_saver/cubit/image_saver_cubit_test.dart';

class MockCoffeeRepository extends Mock implements CoffeeRepository {}

class ImageSaver extends Mock implements ImageSaverWrapper {}

class MockCoffeeCubit extends MockCubit<CoffeeState> implements CoffeeCubit {}

class MockImageSaverCubit extends MockCubit<ImageSaverState>
    implements ImageSaverCubit {}

void main() {
  initHydratedStorage();
  group('CoffeePage', () {
    late CoffeeRepository coffeeRepository;
    late ImageSaverWrapper imageSaver;

    setUp(() {
      coffeeRepository = MockCoffeeRepository();
      imageSaver = MockImageSaver();
    });

    testWidgets('renders CoffeeView', (tester) async {
      await tester.pumpWidget(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(value: coffeeRepository),
            RepositoryProvider.value(value: imageSaver),
          ],
          child: const MaterialApp(home: CoffeePage()),
        ),
      );
      expect(find.byType(CoffeeView), findsOneWidget);
    });
  });

  group('CoffeeView', () {
    late CoffeeCubit coffeeCubit;
    late ImageSaverCubit imageSaverCubit;

    setUp(() {
      coffeeCubit = MockCoffeeCubit();
      imageSaverCubit = MockImageSaverCubit();
    });

    testWidgets('renders CoffeeEmpty for CoffeeStatus.initial', (tester) async {
      when(() => coffeeCubit.state).thenReturn(const CoffeeState());
      when(() => imageSaverCubit.state).thenReturn(const ImageSaverState());
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: coffeeCubit),
            BlocProvider.value(value: imageSaverCubit),
          ],
          child: const MaterialApp(home: CoffeeView()),
        ),
      );
      expect(find.byType(CoffeeEmpty), findsOneWidget);
    });

    testWidgets('renders CoffeeLoading for CoffeeStatus.loading',
        (tester) async {
      when(() => coffeeCubit.state)
          .thenReturn(const CoffeeState(status: CoffeeStatus.loading));
      when(() => imageSaverCubit.state).thenReturn(const ImageSaverState());
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: coffeeCubit),
            BlocProvider.value(value: imageSaverCubit),
          ],
          child: const MaterialApp(home: CoffeeView()),
        ),
      );
      expect(find.byType(CoffeeLoading), findsOneWidget);
    });

    testWidgets('renders CoffeeError for CoffeeStatus.failure', (tester) async {
      when(() => coffeeCubit.state)
          .thenReturn(const CoffeeState(status: CoffeeStatus.failure));
      when(() => imageSaverCubit.state).thenReturn(const ImageSaverState());
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: coffeeCubit),
            BlocProvider.value(value: imageSaverCubit),
          ],
          child: const MaterialApp(home: CoffeeView()),
        ),
      );
      expect(find.byType(CoffeeError), findsOneWidget);
    });

    testWidgets('renders CoffeePopulated for CoffeeStatus.success',
        (tester) async {
      when(() => coffeeCubit.state)
          .thenReturn(const CoffeeState(status: CoffeeStatus.success));
      when(() => imageSaverCubit.state).thenReturn(const ImageSaverState());
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: coffeeCubit),
            BlocProvider.value(value: imageSaverCubit),
          ],
          child: const MaterialApp(home: CoffeeView()),
        ),
      );
      expect(find.byType(CoffeePopulated), findsOneWidget);
    });

    testWidgets('calls fetchCoffee when initial button tapped', (tester) async {
      when(() => coffeeCubit.state).thenReturn(const CoffeeState());
      when(() => imageSaverCubit.state).thenReturn(const ImageSaverState());
      when(() => coffeeCubit.fetchCoffee()).thenAnswer((_) async {});
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: coffeeCubit),
            BlocProvider.value(value: imageSaverCubit),
          ],
          child: const MaterialApp(home: CoffeeView()),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      verify(() => coffeeCubit.fetchCoffee()).called(1);
    });

    testWidgets('calls fetchCoffee when refresh button tapped', (tester) async {
      when(() => coffeeCubit.state)
          .thenReturn(const CoffeeState(status: CoffeeStatus.success));
      when(() => imageSaverCubit.state).thenReturn(const ImageSaverState());
      when(() => coffeeCubit.fetchCoffee()).thenAnswer((_) async {});
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: coffeeCubit),
            BlocProvider.value(value: imageSaverCubit),
          ],
          child: const MaterialApp(home: CoffeeView()),
        ),
      );
      await tester.tap(find.byIcon(Icons.autorenew));
      await tester.pumpAndSettle();
      verify(() => coffeeCubit.fetchCoffee()).called(1);
    });

    testWidgets('calls saveImageFromUrl when download button tapped',
        (tester) async {
      when(() => coffeeCubit.state)
          .thenReturn(const CoffeeState(status: CoffeeStatus.success));
      when(() => imageSaverCubit.state).thenReturn(const ImageSaverState());
      when(() => imageSaverCubit.saveImageFromUrl(any()))
          .thenAnswer((_) async {});
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: coffeeCubit),
            BlocProvider.value(value: imageSaverCubit),
          ],
          child: const MaterialApp(home: CoffeeView()),
        ),
      );
      await tester.tap(find.byIcon(Icons.download));
      await tester.pumpAndSettle();
      verify(() => imageSaverCubit.saveImageFromUrl(any())).called(1);
    });

    testWidgets('calls fetchCoffee when try again button tapped',
        (tester) async {
      when(() => coffeeCubit.state)
          .thenReturn(const CoffeeState(status: CoffeeStatus.failure));
      when(() => imageSaverCubit.state).thenReturn(const ImageSaverState());
      when(() => coffeeCubit.fetchCoffee()).thenAnswer((_) async {});
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: coffeeCubit),
            BlocProvider.value(value: imageSaverCubit),
          ],
          child: const MaterialApp(home: CoffeeView()),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      verify(() => coffeeCubit.fetchCoffee()).called(1);
    });

    testWidgets('calls reset when back button tapped', (tester) async {
      when(() => coffeeCubit.state)
          .thenReturn(const CoffeeState(status: CoffeeStatus.success));
      when(() => imageSaverCubit.state).thenReturn(const ImageSaverState());
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: coffeeCubit),
            BlocProvider.value(value: imageSaverCubit),
          ],
          child: const MaterialApp(home: CoffeeView()),
        ),
      );
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      verify(() => coffeeCubit.reset()).called(1);
    });

    testWidgets('toast shown when missing permissions', (tester) async {
      when(() => coffeeCubit.state)
          .thenReturn(const CoffeeState(status: CoffeeStatus.success));
      when(() => imageSaverCubit.state).thenReturn(const ImageSaverState());

      whenListen(
        imageSaverCubit,
        Stream<ImageSaverState>.fromIterable([
          const ImageSaverState(),
          const ImageSaverState(status: ImageSaverStatus.missingPermissions),
        ]),
      );
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: coffeeCubit),
            BlocProvider.value(value: imageSaverCubit),
          ],
          child: const MaterialApp(home: CoffeeView()),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Card), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 7));
    });
  });
}
