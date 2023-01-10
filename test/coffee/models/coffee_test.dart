// ignore_for_file: prefer_const_constructors
import 'package:coffee_app/coffee/coffee.dart';
import 'package:test/test.dart';

import '../../helpers/hydrated_bloc.dart';

const coffeeImageUrl = 'mockedUrl';

void main() {
  initHydratedStorage();

  group('Coffee', () {
    group('copyWith', () {
      test('works correctly without params', () {
        final coffee = Coffee(imageUrl: coffeeImageUrl);
        expect(coffee.copyWith(), coffee);
      });
    });
  });
}
