import 'package:character_search_app/presentation/features/character_search/widgets/character_search_list_widget/character_search_list_persistent_header/character_search_list_persistent_header_delegate.dart';
import 'package:flutter/material.dart';

class CharacterSearchListPersistentHeaderWidget extends StatelessWidget {
  const CharacterSearchListPersistentHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: false,
      floating: true,
      delegate: CharacterSearchListPersistentHeaderDelegate(
        minExtent: 50,
        maxExtent: 63,
      ),
    );
  }
}
