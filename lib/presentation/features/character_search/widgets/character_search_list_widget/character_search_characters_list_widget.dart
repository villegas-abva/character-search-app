import 'package:character_search_app/domain/character_search/character_search_bloc.dart';
import 'package:character_search_app/presentation/device_type.dart';
import 'package:character_search_app/presentation/features/character_search/widgets/character_search_phone/characer_search_phone_character_tile.dart';
import 'package:character_search_app/presentation/features/character_search/widgets/character_search_tablet/character_search_tablet_search_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterSearchCharactersListWidget extends StatelessWidget {
  const CharacterSearchCharactersListWidget({
    required this.onTap,
    super.key,
  });

  final void Function(dynamic) onTap;

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = DeviceInfo.getDeviceType(context);
    bool isPhone = deviceType == DeviceType.phone;

    return BlocBuilder<CharacterSearchBloc, CharacterSearchState>(
      builder: (context, state) {
        if (state is LoadedCharactersSearchState) {
          final characters = state.characters;

          // return ListView.builder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   // shrinkWrap: true,
          //   itemCount: characters.length,
          //   itemBuilder: (context, index) {
          //     final character = characters[index];
          //     return isPhone
          //         ? CharacterSearchPhoneCharacterTile(
          //             character: character,
          //             onTap: () => onTap(character),
          //           )
          //         : CharacterSearchTabletCharacterTile(
          //             character: character,
          //             onTap: () => onTap(character),
          //           );
          //   },
          // );
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: characters.length,
              (BuildContext context, index) {
                final character = characters[index];
                return isPhone
                    ? CharacterSearchPhoneCharacterTile(
                        character: character,
                        onTap: () => onTap(character),
                      )
                    : CharacterSearchTabletCharacterTile(
                        character: character,
                        onTap: () => onTap(character),
                      );
              },
            ),
          );

// TODO: remove after testing...
          // return ListView.builder(
          //     physics: const NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: characters.length,
          //     itemBuilder: (context, index) {
          //       final character = characters[index];
        }
        if (state is LoadingCharactersSearchState) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
