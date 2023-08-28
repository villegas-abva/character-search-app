import 'dart:convert';

import 'package:character_search_app/presentation/theme/theme.dart';
import 'package:character_search_app/service/api_service.dart';
import 'package:character_search_app/service/models/models.dart';

class CharacterRepository {
  CharacterRepository({
    required this.apiService,
    required this.searchTerm,
  });

  final ApiService apiService;
  final String searchTerm;

  Future<List<Character>> fetchCharacters() async {
    final response = await apiService.getCharacters(searchTerm, "json");
    final jsonString = response.toString();
    final data = json.decode(jsonString);

    if (data != null && data is Map<String, dynamic>) {
      final relatedTopicsField = data['RelatedTopics'];
      final results = relatedTopicsField as List<dynamic>;

      final charactersList = results.map((character) {
        // extract the character name and description from the "Text" field (a long, generic String).
        String charTextField = character['Text'];
        // this split logic is based on the observation that each 'text' field begins with the
        // character's name, i.e. "Homero Simpson"
        // then there's a " - " division before the rest of the String follows.
        List<String> charFieldsSpanParts = charTextField.split(' - ');
        // this check is done in case a character's "Text" field can't be split by the above logic, which
        // would throw an exception. There's currently one character that doesn't follow this
        // main logic: The Wire's "The Greeks".
        bool hasEnoughSpanParts = charFieldsSpanParts.length > 1;
        final charIcon = character['Icon'];

        return Character(
          name: hasEnoughSpanParts
              ? charFieldsSpanParts[0]
              : AppStrings.thisCharacter,
          description: hasEnoughSpanParts
              ? charFieldsSpanParts[1]
              : AppStrings.thisCharactersDescription,
          image: CharacterIcon(
            // just use the 'url' field currently.
            url: charIcon['URL'],
          ),
        );
      }).toList();

      return charactersList;
    } else {
      throw Exception('Invalid API response format');
    }
  }
}
