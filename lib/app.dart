import 'package:character_search_app/domain/character_search/character_search_bloc.dart';
import 'package:character_search_app/flavor_config.dart';
import 'package:character_search_app/presentation/features/character_search/screens/character_search_wrapper.dart';
import 'package:character_search_app/service/api_service.dart';
import 'package:character_search_app/service/repository/character_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'presentation/features/character_search/widgets/character_search_tablet/tablet_selected_character_state.dart';

class CharacterSearchApp extends StatelessWidget {
  const CharacterSearchApp({
    required this.flavorConfig,
    super.key,
  });

  final FlavorConfig flavorConfig;

  ApiService get apiService => ApiService(
        Dio(
          BaseOptions(
            contentType: 'application/json',
            baseUrl: flavorConfig.flavorUrl,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Character Search App',
      home: ChangeNotifierProvider(
        create: (context) => TabletSelectedCharacterState(),
        child: Provider(
          create: (context) => flavorConfig,
          child: BlocProvider(
            create: (context) => CharacterSearchBloc(
              characterRepo: CharacterRepository(
                apiService: apiService,
                searchTerm: flavorConfig.searchTerm,
              ),
            )..add(FetchCharacters()),
            child: const CharacterSearchWrapper(),
          ),
        ),
      ),
    );
  }
}
