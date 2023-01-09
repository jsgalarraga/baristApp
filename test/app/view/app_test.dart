import 'package:coffee_app/app/app.dart';
import 'package:coffee_app/coffee/coffee.dart';
import 'package:coffee_repository/coffee_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CoffeePage', (tester) async {
      await tester.pumpWidget(
        App(
          coffeeRepository: CoffeeRepository(),
        ),
      );
      expect(find.byType(CoffeePage), findsOneWidget);
    });
  });
}
