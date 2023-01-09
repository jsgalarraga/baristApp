import 'package:coffee_app/coffee/coffee.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CoffeeStatusX', () {
    test('returns correct values for CoffeeStatus.initial', () {
      const status = CoffeeStatus.initial;
      expect(status.isInitial, isTrue);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for CoffeeStatus.loading', () {
      const status = CoffeeStatus.loading;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for CoffeeStatus.success', () {
      const status = CoffeeStatus.success;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for CoffeeStatus.failure', () {
      const status = CoffeeStatus.failure;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isTrue);
    });
  });
}
