import 'package:character_search_app/service/app_exception.dart';
import 'package:character_search_app/service/repository/character_repository.dart';
import 'package:character_search_app/service/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_search_event.dart';
part 'character_search_state.dart';

class CharacterSearchBloc
    extends Bloc<CharacterSearchEvent, CharacterSearchState> {
  CharacterSearchBloc({
    required this.characterRepo,
  }) : super(InitialCharactersSearchState()) {
    on<FetchCharacters>(_fetchCharacters);
    on<SortCharactersByTerm>(_sortCharactersByTerm);
  }

  final CharacterRepository characterRepo;

  /// The list of characters that will be managed through this bloc.
  late List<Character> characters = [];

  Future<void> _fetchCharacters(
    FetchCharacters event,
    Emitter<CharacterSearchState> emit,
  ) async {
    emit(LoadingCharactersSearchState());
    try {
      List<Character> unfilteredCharacters =
          await characterRepo.fetchCharacters();

      characters = unfilteredCharacters;
      emit(LoadedCharactersSearchState(characters: unfilteredCharacters));
    } catch (e) {
      emit(ErrorCharactersSearchState(AppException.fromObject(e)));
    }
  }

  Future<void> _sortCharactersByTerm(
    SortCharactersByTerm event,
    Emitter<CharacterSearchState> emit,
  ) async {
    emit(LoadingCharactersSearchState());
    try {
      /// Based on the logic for getting a character's name and description, sorting characters
      /// by term only accounts for the [description]. This is because a character's [name] is extracted from
      /// the [description].
      List<Character> sortedCharacters = characters
          .where(
            (char) => char.name.toLowerCase().contains(event.searchTerm),
          )
          .toList();

      emit(LoadedCharactersSearchState(characters: sortedCharacters));
    } catch (e) {
      emit(ErrorCharactersSearchState(AppException.fromObject(e)));
    }
  }
}
