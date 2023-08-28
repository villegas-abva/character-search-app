import 'package:character_search_app/service/models/character_icon.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'character.g.dart';

@JsonSerializable()
class Character extends Equatable {
  const Character({
    required this.name,
    required this.description,
    this.image,
  });

  final String name;
  final String description;
  final CharacterIcon? image;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  List<Object?> get props => [
        name,
        description,
        image,
      ];
}
