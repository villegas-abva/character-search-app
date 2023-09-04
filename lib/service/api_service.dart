import 'package:character_search_app/service/models/models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.duckduckgo.com/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  /// This json includes characters, among other properties. Some parsing, mapping, and String
  /// manipulation is needed to extract a [Character]'s values.
  ///
  /// This parsing, mapping, and String manipulation is done inside [CharacterRepository]'s
  /// [fetchCharacters] function.
  @GET('/')
  // Future<List<Character>> getCharacters(
  Future<dynamic> getCharacters(
    @Query("q") String query,
    @Query("format") String format,
  );
}
