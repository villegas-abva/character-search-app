import 'package:character_search_app/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:character_search_app/app.dart';

void main() {
  // Change this based on active flavor
  const activeFlavor = AppFlavors.theWire;

  final flavorConfig = FlavorConfig.fromFlavor(activeFlavor);
  runApp(CharacterSearchApp(flavorConfig: flavorConfig));
}
