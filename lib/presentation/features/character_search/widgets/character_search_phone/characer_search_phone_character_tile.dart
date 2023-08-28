import 'package:flutter/material.dart';
import 'package:character_search_app/service/models/character.dart';

class CharacterSearchPhoneCharacterTile extends StatelessWidget {
  /// A character tile for the phone flow.
  const CharacterSearchPhoneCharacterTile({
    required this.character,
    required this.onTap,
    this.isSelected = false,
    super.key,
  });

  final Character character;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(character.name),
            ],
          ),
        ));
  }
}
