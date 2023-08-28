part of 'character_search_bloc.dart';

abstract class CharacterSearchState extends Equatable {
  const CharacterSearchState();

  @override
  List<Object?> get props => [];
}

class InitialCharactersSearchState extends CharacterSearchState {}

class LoadingCharactersSearchState extends CharacterSearchState {}

class LoadedCharactersSearchState extends CharacterSearchState {
  const LoadedCharactersSearchState({required this.characters});

  final List<Character> characters;

  @override
  List<Object?> get props => [characters];
}

class ErrorCharactersSearchState extends CharacterSearchState {
  const ErrorCharactersSearchState(this.error);

  final AppException error;

  @override
  List<Object?> get props => [error];
}
