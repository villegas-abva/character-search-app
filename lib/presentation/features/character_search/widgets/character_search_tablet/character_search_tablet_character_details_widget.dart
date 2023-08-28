import 'package:character_search_app/presentation/features/character_search/widgets/character_search_phone/character_details_image_phone_widget.dart';
import 'package:character_search_app/presentation/features/character_search/widgets/character_search_tablet/character_search_tablet_character_details_initial_state_widget.dart';
import 'package:character_search_app/presentation/features/character_search/widgets/character_search_tablet/tablet_selected_character_state.dart';
import 'package:character_search_app/presentation/theme/theme.dart';
import 'package:character_search_app/service/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterSearchTabletCharacterDetailsWidget extends StatelessWidget {
  const CharacterSearchTabletCharacterDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TabletSelectedCharacterState>(
      builder: (context, characterState, child) {
        Character character = characterState.selectedCharacter;
        bool noSelection =
            character == const Character(name: '', description: '');

        return noSelection
            ? const CharacterSearchTabletCharacterDetailsInitialStateWidget()
            : Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60),
                          child: Text(AppStrings.thisCharacter,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60),
                          child: Stack(
                            children: [
                              CharacterDetailsImagePhoneWidget(
                                  url: character.image?.url),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            character.name,
                            style: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          character.description,
                          style: const TextStyle(
                            fontSize: 22,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
