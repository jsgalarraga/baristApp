// ignore_for_file: prefer_const_constructors
import 'package:coffee_api/coffee_api.dart' as coffee_api;
import 'package:coffee_repository/coffee_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockCoffeeApiClient extends Mock implements coffee_api.CoffeeApiClient {}

class MockCoffee extends Mock implements coffee_api.Coffee {}

void main() {
  group('CoffeeRepository', () {
    late coffee_api.CoffeeApiClient coffeeApiClient;
    late CoffeeRepository coffeeRepository;

    setUp(() {
      coffeeApiClient = MockCoffeeApiClient();
      coffeeRepository = CoffeeRepository(
        coffeeApiClient: coffeeApiClient,
      );
    });

    group('constructor', () {
      test('instantiates internal coffee api client when not injected', () {
        expect(CoffeeRepository(), isNotNull);
      });
    });

    group('getRandomCoffee', () {
      const imageUrl = 'mockedUrl';

      test('calls getRandomCoffee correctly', () async {
        try {
          await coffeeRepository.getRandomCoffee();
        } catch (_) {}
        verify(() => coffeeApiClient.getRandomCoffee()).called(1);
      });

      test('throws exception when api call fails', () async {
        final exception = Exception();
        when(() => coffeeApiClient.getRandomCoffee()).thenThrow(exception);
        expect(
          () async => coffeeRepository.getRandomCoffee(),
          throwsA(exception),
        );
      });

      test('returns correct coffee on success', () async {
        final coffee = MockCoffee();
        when(() => coffee.file).thenReturn(imageUrl);
        when(() => coffeeApiClient.getRandomCoffee()).thenAnswer(
          (_) async => coffee,
        );
        final actual = await coffeeRepository.getRandomCoffee();
        expect(
          actual,
          Coffee(imageUrl: imageUrl),
        );
      });
    });
  });
}
