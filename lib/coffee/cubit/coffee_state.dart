part of 'coffee_cubit.dart';

enum CoffeeStatus { initial, loading, success, failure }

extension CoffeeStatusX on CoffeeStatus {
  bool get isInitial => this == CoffeeStatus.initial;
  bool get isLoading => this == CoffeeStatus.loading;
  bool get isSuccess => this == CoffeeStatus.success;
  bool get isFailure => this == CoffeeStatus.failure;
}

@JsonSerializable()
class CoffeeState extends Equatable {
  const CoffeeState({
    this.status = CoffeeStatus.initial,
    Coffee? coffee,
  }) : coffee = coffee ?? Coffee.empty;

  factory CoffeeState.fromJson(Map<String, dynamic> json) =>
      _$CoffeeStateFromJson(json);

  final CoffeeStatus status;
  final Coffee coffee;

  CoffeeState copyWith({
    CoffeeStatus? status,
    Coffee? coffee,
  }) {
    return CoffeeState(
      status: status ?? this.status,
      coffee: coffee ?? this.coffee,
    );
  }

  Map<String, dynamic> toJson() => _$CoffeeStateToJson(this);

  @override
  List<Object?> get props => [status, coffee];
}
