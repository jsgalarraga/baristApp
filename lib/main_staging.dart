import 'package:coffee_app/app/app.dart';
import 'package:coffee_app/bootstrap.dart';
import 'package:coffee_repository/coffee_repository.dart';

void main() {
  bootstrap(
    () => App(
      coffeeRepository: CoffeeRepository(),
    ),
  );
}
