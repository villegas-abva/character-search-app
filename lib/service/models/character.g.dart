// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] == null
          ? null
          : CharacterIcon.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
