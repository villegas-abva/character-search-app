import 'package:character_search_app/presentation/features/character_search/widgets/character_search_tablet/tablet_selected_character_state.dart';
import 'package:flutter/material.dart';
import 'package:character_search_app/service/models/character.dart';
import 'package:provider/provider.dart';

class CharacterSearchTabletCharacterTile extends StatelessWidget {
  /// A character tile for the tablet flow. Similar to that of the phone flow except that there's a [Consumer] widget which rebuilds
  /// this widget based on the [TabletSelectedCharacterState].
  const CharacterSearchTabletCharacterTile({
    required this.character,
    required this.onTap,
    super.key,
  });

  final Character character;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Consumer<TabletSelectedCharacterState>(
        builder: (context, characterState, child) {
          bool isCharacterSelected =
              characterState.selectedCharacter == character;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            decoration: BoxDecoration(
                color: isCharacterSelected ? Colors.blue : Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(character.name),
              ],
            ),
          );
        },
      ),
    );
  }
}
