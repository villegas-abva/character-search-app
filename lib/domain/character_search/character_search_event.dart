part of 'character_search_bloc.dart';

abstract class CharacterSearchEvent extends Equatable {
  const CharacterSearchEvent();

  @override
  List<Object?> get props => [];
}

class FetchCharacters extends CharacterSearchEvent {}

class SortCharactersByTerm extends CharacterSearchEvent {
  const SortCharactersByTerm({
    required this.searchTerm,
    required this.unsortedCharacters,
  });

  final String searchTerm;
  final List<Character> unsortedCharacters;

  @override
  List<Object?> get props => [searchTerm, unsortedCharacters];
}
