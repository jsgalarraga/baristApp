import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coffee.g.dart';

@JsonSerializable()
class Coffee extends Equatable {
  const Coffee({
    required this.imageUrl,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) => _$CoffeeFromJson(json);

  Map<String, dynamic> toJson() => _$CoffeeToJson(this);

  final String imageUrl;

  @override
  List<Object> get props => [imageUrl];
}
