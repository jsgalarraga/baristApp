import 'package:test/test.dart';
import 'package:coffee_api/coffee_api.dart';

void main() {
  group('Coffee', () {
    group('fromJson', () {
      test('returns correct Coffee object', () {
        expect(
          Coffee.fromJson(
            <String, dynamic>{'file': 'imageUrl'},
          ),
          isA<Coffee>().having((c) => c.file, 'file', 'imageUrl'),
        );
      });
    });
  });
}
