import 'package:flutter/material.dart';

class CharacterDetailsImagePhoneWidget extends StatelessWidget {
  /// Returns either a character's image or a placeholder image, depending on whether there's an image
  /// associated with this character.
  const CharacterDetailsImagePhoneWidget({
    required this.url,
    super.key,
  });

  final String? url;
  bool get _hasImage => (url ?? '').isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _hasImage
          ? Image.network('https://duckduckgo.com/${url!}')
          : Image.asset('assets/images/character_placeholder_image.png'),
    );
  }
}
