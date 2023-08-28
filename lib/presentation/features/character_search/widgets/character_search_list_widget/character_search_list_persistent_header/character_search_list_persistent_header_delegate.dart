import 'package:character_search_app/domain/character_search/character_search_bloc.dart';
import 'package:character_search_app/presentation/features/character_search/widgets/character_search_textfield.dart';
import 'package:character_search_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class CharacterSearchListPersistentHeaderDelegate
    implements SliverPersistentHeaderDelegate {
  CharacterSearchListPersistentHeaderDelegate({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: CharacterSearchTextfield(
        controller: controller,
        hintText: AppStrings.searchForACharacter,
        onChanged: (value) {
          context.read<CharacterSearchBloc>().add(
                SortCharactersByTerm(
                  searchTerm: value.toLowerCase().trim(),
                  unsortedCharacters: const [],
                ),
              );
        },
      ),
    );
  }

  @override
  bool shouldRebuild(
      covariant CharacterSearchListPersistentHeaderDelegate oldDelegate) {
    // Return true if the header should be rebuilt when its properties change
    return false;
  }

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider? get vsync => null;
}
