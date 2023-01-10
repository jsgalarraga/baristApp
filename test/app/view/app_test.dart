import 'package:coffee_app/app/app.dart';
import 'package:coffee_app/coffee/coffee.dart';
import 'package:coffee_repository/coffee_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_saver_wrapper/image_saver_wrapper.dart';

void main() {
  group('App', () {
    testWidgets('renders CoffeePage', (tester) async {
      await tester.pumpWidget(
        App(
          coffeeRepository: CoffeeRepository(),
          imageSaver: ImageSaverWrapper(),
        ),
      );
      expect(find.byType(CoffeePage), findsOneWidget);
    });
  });
}
