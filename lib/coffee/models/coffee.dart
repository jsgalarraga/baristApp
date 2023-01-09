import 'package:coffee_repository/coffee_repository.dart' as coffee_repository;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coffee.g.dart';

@JsonSerializable()
class Coffee extends Equatable {
  const Coffee({
    required this.imageUrl,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) => _$CoffeeFromJson(json);

  factory Coffee.fromRepository(coffee_repository.Coffee coffee) {
    return Coffee(
      imageUrl: coffee.imageUrl,
    );
  }

  static const empty = Coffee(
    imageUrl: '',
  );

  final String imageUrl;

  @override
  List<Object> get props => [imageUrl];

  Map<String, dynamic> toJson() => _$CoffeeToJson(this);

  Coffee copyWith({
    String? imageUrl,
  }) {
    return Coffee(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
