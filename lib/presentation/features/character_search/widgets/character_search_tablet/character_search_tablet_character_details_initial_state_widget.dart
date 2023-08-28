import 'package:character_search_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CharacterSearchTabletCharacterDetailsInitialStateWidget
    extends StatelessWidget {
  const CharacterSearchTabletCharacterDetailsInitialStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.selectACharacter,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 35,
        ),
      ),
    );
  }
}
