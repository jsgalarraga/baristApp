// ignore_for_file: prefer_const_constructors
import 'package:coffee_api/coffee_api.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('CoffeeApiClient', () {
    late http.Client httpClient;
    late CoffeeApiClient apiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      apiClient = CoffeeApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(CoffeeApiClient(), isNotNull);
      });
    });

    group('getRandomCoffee', () {
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        try {
          await apiClient.getRandomCoffee();
        } catch (_) {}
        verify(
          () => httpClient.get(
            Uri.https(
              'coffee.alexflipnote.dev',
              '/random.json',
            ),
          ),
        ).called(1);
      });

      test('throws CoffeeRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          () async => apiClient.getRandomCoffee(),
          throwsA(isA<CoffeeRequestFailure>()),
        );
      });

      test('returns Coffee on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(
          '''
{
  "file": "imageUrl"
}''',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        final actual = await apiClient.getRandomCoffee();
        expect(
          actual,
          isA<Coffee>().having((c) => c.file, 'file', 'imageUrl'),
        );
      });
    });
  });
}
