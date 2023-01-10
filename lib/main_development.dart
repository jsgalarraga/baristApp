import 'package:coffee_app/app/app.dart';
import 'package:coffee_app/bootstrap.dart';
import 'package:coffee_repository/coffee_repository.dart';
import 'package:image_saver_wrapper/image_saver_wrapper.dart';

void main() {
  bootstrap(
    () => App(
      coffeeRepository: CoffeeRepository(),
      imageSaver: ImageSaverWrapper(),
    ),
  );
}
