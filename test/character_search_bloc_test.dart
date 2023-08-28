import 'package:bloc_test/bloc_test.dart';
import 'package:character_search_app/domain/character_search/character_search_bloc.dart';
import 'package:character_search_app/service/app_exception.dart';
import 'package:character_search_app/service/mock_data.dart';
import 'package:character_search_app/service/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'mocks/app_mocks.dart';

void main() {
  group(
    'CharacterSearchBloc tests',
    () {
      late MockCharacterRepository mockCharacterRepository;

      final List<Character> mockCharactersList = MockData.mockCharactersList;
      const appException = AppException('', '');

      late CharacterSearchBloc characterSearchBloc;

      setUp(() {
        characterSearchBloc =
            CharacterSearchBloc(characterRepo: MockCharacterRepository());

        mockCharacterRepository = MockCharacterRepository();
        registerFallbackValue(mockCharactersList);
      });

      tearDown(() {
        characterSearchBloc.close();
      });

      test('Initial state (test) is InitialCharactersSearchState', () {
        expect(characterSearchBloc.state, InitialCharactersSearchState());
      });

      blocTest<CharacterSearchBloc, CharacterSearchState>(
        'Initial state (blocTest) is empty',
        build: () => characterSearchBloc,
        expect: () => [],
      );

      blocTest<CharacterSearchBloc, CharacterSearchState>(
        'Emit [LoadingCharactersSearchState, LoadedCharactersSearchState] states on successful fetchCharacters event',
        build: () {
          when(
            () => mockCharacterRepository.fetchCharacters(),
          ).thenAnswer((_) async => mockCharactersList);

          return CharacterSearchBloc(characterRepo: mockCharacterRepository);
        },
        act: (bloc) => bloc.add(FetchCharacters()),
        expect: () => [
          LoadingCharactersSearchState(),
          LoadedCharactersSearchState(characters: mockCharactersList),
        ],
      );
      blocTest<CharacterSearchBloc, CharacterSearchState>(
        'Emit [LoadingCharactersSearchState, ErrorCharactersSearchState] states on Unsuccessful fetchCharacters event',
        build: () {
          when(() => mockCharacterRepository.fetchCharacters())
              .thenThrow(appException);

          return CharacterSearchBloc(characterRepo: mockCharacterRepository);
        },
        act: (bloc) => bloc.add(FetchCharacters()),
        expect: () => [
          LoadingCharactersSearchState(),
          const ErrorCharactersSearchState(appException),
        ],
      );
    },
  );
}
