import 'package:character_search_app/service/models/models.dart';
import 'package:flutter/material.dart';

class CharacterDetailsPhoneWidget extends StatelessWidget {
  /// A [Character]'s details.
  const CharacterDetailsPhoneWidget({
    required this.character,
    super.key,
  });

  final Character character;
  bool get hasImage => (character.image?.url ?? '').isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('This Character')),
        body: Padding(
          padding: const EdgeInsets.only(top: 33),
          child: Column(
            children: [
              if (hasImage)
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        'https://duckduckgo.com/${character.image?.url}',
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.25),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
