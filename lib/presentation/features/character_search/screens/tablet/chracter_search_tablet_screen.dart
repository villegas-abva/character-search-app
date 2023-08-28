import 'package:character_search_app/flavor_config.dart';
import 'package:character_search_app/presentation/features/character_search/widgets/character_search_list_widget/character_search_list_widget.dart';
import 'package:character_search_app/presentation/features/character_search/widgets/character_search_tablet/character_search_tablet_character_details_widget.dart';
import 'package:character_search_app/presentation/features/character_search/widgets/character_search_tablet/tablet_selected_character_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterSearchTabletScreen extends StatelessWidget {
  const CharacterSearchTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final flavor = context.read<FlavorConfig>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          flavor.flavorName == 'simpsons' ? 'The Simpsons' : 'The Wire',
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 13),
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: CharacterSearchListWidget(
              onTap: (char) {
                Provider.of<TabletSelectedCharacterState>(context,
                        listen: false)
                    .setSelectedCharacter(char);
                // print('tablet!');
              },
            ),
          ),
          const Expanded(
            flex: 2,
            child: CharacterSearchTabletCharacterDetailsWidget(),
          ),
        ],
      ),
    );
  }
}
