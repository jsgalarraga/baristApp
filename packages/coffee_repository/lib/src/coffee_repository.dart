import 'dart:async';

import 'package:coffee_api/coffee_api.dart' hide Coffee;
import 'package:coffee_repository/coffee_repository.dart';

class CoffeeRepository {
  CoffeeRepository({CoffeeApiClient? coffeeApiClient})
      : _coffeeApiClient = coffeeApiClient ?? CoffeeApiClient();

  final CoffeeApiClient _coffeeApiClient;

  Future<Coffee> getRandomCoffee() async {
    final coffee = await _coffeeApiClient.getRandomCoffee();
    return Coffee(
      imageUrl: coffee.file,
    );
  }
}
