import 'package:character_search_app/presentation/features/character_search/widgets/character_search_phone/character_details_image_phone_widget.dart';
import 'package:character_search_app/presentation/theme/theme.dart';
import 'package:character_search_app/service/models/models.dart';
import 'package:flutter/material.dart';

class CharacterDetailsPhoneScreen extends StatelessWidget {
  /// A [Character]'s details.
  const CharacterDetailsPhoneScreen({
    required this.character,
    required this.header,
    super.key,
  });

  final Character character;
  final String header;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      header,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Text(AppStrings.character,
                    style: const TextStyle(fontSize: 30)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Stack(
                  children: [
                    CharacterDetailsImagePhoneWidget(url: character.image?.url),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  character.name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                character.description,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
