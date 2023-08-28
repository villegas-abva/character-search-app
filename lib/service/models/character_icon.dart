import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'character_icon.g.dart';

@JsonSerializable()
class CharacterIcon extends Equatable {
  const CharacterIcon({
    this.height,
    this.width,
    this.url,
  });

  final int? height;
  final int? width;
  final String? url;

  factory CharacterIcon.fromJson(Map<String, dynamic> json) =>
      _$CharacterIconFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterIconToJson(this);

  @override
  List<Object?> get props => [
        height,
        width,
        url,
      ];
}
