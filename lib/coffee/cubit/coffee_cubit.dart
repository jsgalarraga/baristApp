import 'package:coffee_app/coffee/models/models.dart';
import 'package:coffee_repository/coffee_repository.dart' show CoffeeRepository;
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coffee_cubit.g.dart';
part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit(this._coffeeRepository) : super(const CoffeeState());

  final CoffeeRepository _coffeeRepository;

  Future<void> fetchCoffee() async {
    emit(state.copyWith(status: CoffeeStatus.loading));

    try {
      final coffee = Coffee.fromRepository(
        await _coffeeRepository.getRandomCoffee(),
      );

      emit(
        state.copyWith(
          status: CoffeeStatus.success,
          coffee: coffee,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: CoffeeStatus.failure));
    }
  }

  @override
  CoffeeState fromJson(Map<String, dynamic> json) => CoffeeState.fromJson(json);

  @override
  Map<String, dynamic> toJson(CoffeeState state) => state.toJson();
}
