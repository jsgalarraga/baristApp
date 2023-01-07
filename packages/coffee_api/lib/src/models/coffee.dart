import 'package:json_annotation/json_annotation.dart';

part 'coffee.g.dart';

@JsonSerializable()
class Coffee {
  const Coffee({
    required this.file,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) => _$CoffeeFromJson(json);

  final String file;
}
