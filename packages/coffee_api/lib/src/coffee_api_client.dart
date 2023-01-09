import 'dart:async';
import 'dart:convert';

import 'package:coffee_api/coffee_api.dart';
import 'package:http/http.dart' as http;

/// Exception thrown when getRandomCoffee fails.
class CoffeeRequestFailure implements Exception {}

/// Dart API Client which wraps the [Coffee API](https://coffee.alexflipnote.dev/).
class CoffeeApiClient {
  CoffeeApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  static const _baseUrlCoffee = 'coffee.alexflipnote.dev';

  final http.Client _httpClient;

  /// Fetches a random [Coffee].
  Future<Coffee> getRandomCoffee() async {
    final coffeeRequest = Uri.https(_baseUrlCoffee, '/random.json');

    final coffeeResponse = await _httpClient.get(coffeeRequest);

    if (coffeeResponse.statusCode != 200) {
      throw CoffeeRequestFailure();
    }

    final bodyJson = jsonDecode(coffeeResponse.body) as Map<String, dynamic>;

    return Coffee.fromJson(bodyJson);
  }
}
