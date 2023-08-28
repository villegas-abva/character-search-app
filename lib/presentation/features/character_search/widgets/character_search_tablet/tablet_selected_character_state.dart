import 'package:character_search_app/service/models/models.dart';
import 'package:flutter/material.dart';

/// A [ChangeNotifier] used to keep track the current selected character for the tablet flow. Initially, the [selected]
/// character is the firs on the list.
class TabletSelectedCharacterState extends ChangeNotifier {
  Character _selectedCharacter = const Character(name: '', description: '');

  void setSelectedCharacter(Character character) {
    if (_selectedCharacter == character) {
      return;
    }
    _selectedCharacter = character;
    notifyListeners();
    // printSelectedChar();
  }

  Character get selectedCharacter => _selectedCharacter;

  printSelectedChar() => print(['selectedChar: ${_selectedCharacter.name}']);
}
