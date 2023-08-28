import 'package:character_search_app/presentation/features/character_search/widgets/character_search_list_widget/character_search_characters_list_widget.dart';
import 'package:character_search_app/presentation/features/character_search/widgets/character_search_list_widget/character_search_list_persistent_header/character_search_list_persistent_header_widget.dart';
import 'package:flutter/material.dart';

class CharacterSearchListWidget extends StatelessWidget {
  /// A [CharacterSearchTextfield] and a list of [Character]s.
  ///
  /// Made up of [Sliver] widgets in order to have the search textfield readily accessible and visible
  /// upon swiping up on this widgets lists.
  const CharacterSearchListWidget({
    required this.onTap,
    super.key,
  });

  final void Function(dynamic) onTap;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CharacterSearchListPersistentHeaderWidget(),
        CharacterSearchCharactersListWidget(onTap: onTap),
      ],
    );
  }
}
