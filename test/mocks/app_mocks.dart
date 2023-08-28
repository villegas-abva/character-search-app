import 'package:bloc_test/bloc_test.dart';
import 'package:character_search_app/domain/character_search/character_search_bloc.dart';
import 'package:character_search_app/service/repository/character_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

class MockCharacterSearchBloc
    extends MockBloc<CharacterSearchEvent, CharacterSearchState>
    implements CharacterSearchBloc {}
