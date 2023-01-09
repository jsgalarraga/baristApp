// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_app/coffee/coffee.dart';
import 'package:coffee_repository/coffee_repository.dart' as coffee_repository;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../helpers/hydrated_bloc.dart';

const coffeeImageUrl = 'mockedUrl';

class MockCoffeeRepository extends Mock
    implements coffee_repository.CoffeeRepository {}

class MockCoffee extends Mock implements coffee_repository.Coffee {}

void main() {
  initHydratedStorage();

  group('CoffeeCubit', () {
    late coffee_repository.Coffee coffee;
    late coffee_repository.CoffeeRepository coffeeRepository;
    late CoffeeCubit coffeeCubit;

    setUp(() async {
      coffee = MockCoffee();
      coffeeRepository = MockCoffeeRepository();
      when(() => coffee.imageUrl).thenReturn(coffeeImageUrl);
      when(
        () => coffeeRepository.getRandomCoffee(),
      ).thenAnswer((_) async => coffee);
      coffeeCubit = CoffeeCubit(coffeeRepository);
    });

    test('initial state is correct', () {
      final coffeeCubit = CoffeeCubit(coffeeRepository);
      expect(coffeeCubit.state, CoffeeState());
    });

    group('toJson/fromJson', () {
      test('work correctly', () {
        final coffeeCubit = CoffeeCubit(coffeeRepository);
        expect(
          coffeeCubit.fromJson(coffeeCubit.toJson(coffeeCubit.state)),
          coffeeCubit.state,
        );
      });
    });

    group('fetchCoffee', () {
      blocTest<CoffeeCubit, CoffeeState>(
        'calls getRandomCoffee correctly',
        build: () => coffeeCubit,
        act: (cubit) => cubit.fetchCoffee(),
        verify: (_) {
          verify(() => coffeeRepository.getRandomCoffee()).called(1);
        },
      );

      blocTest<CoffeeCubit, CoffeeState>(
        'emits [loading, failure] when getRandomCoffee throws',
        setUp: () {
          when(
            () => coffeeRepository.getRandomCoffee(),
          ).thenThrow(Exception());
        },
        build: () => coffeeCubit,
        act: (cubit) => cubit.fetchCoffee(),
        expect: () => <CoffeeState>[
          CoffeeState(status: CoffeeStatus.loading),
          CoffeeState(status: CoffeeStatus.failure),
        ],
      );

      blocTest<CoffeeCubit, CoffeeState>(
        'emits [loading, success] when getRandomCoffee returns correctly',
        build: () => coffeeCubit,
        act: (cubit) => cubit.fetchCoffee(),
        expect: () => <dynamic>[
          CoffeeState(status: CoffeeStatus.loading),
          isA<CoffeeState>()
              .having((c) => c.status, 'status', CoffeeStatus.success)
              .having(
                (c) => c.coffee,
                'coffee',
                isA<Coffee>()
                    .having((c) => c.imageUrl, 'imageUrl', coffeeImageUrl),
              ),
        ],
      );
    });
  });
}
