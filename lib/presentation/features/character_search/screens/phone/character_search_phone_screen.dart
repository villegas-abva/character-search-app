import 'package:character_search_app/flavor_config.dart';
import 'package:character_search_app/presentation/features/character_search/screens/phone/character_details_phone_screen.dart';
import 'package:character_search_app/presentation/features/character_search/widgets/character_search_list_widget/character_search_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterSearchPhoneScreen extends StatelessWidget {
  const CharacterSearchPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final flavor = context.read<FlavorConfig>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          flavor.flavorName == 'simpsons' ? 'The Simpsons' : 'The Wire',
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 13),
        ),
      ),
      body: CharacterSearchListWidget(
        onTap: (char) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailsPhoneScreen(
              character: char,
              header:
                  flavor.flavorName == 'simpsons' ? 'The Simpsons' : 'The Wire',
            ),
          ),
        ),
      ),
    );
  }
}
