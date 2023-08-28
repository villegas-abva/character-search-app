enum AppFlavors {
  theSimpsons,
  theWire,
}

class FlavorConfig {
  final String flavorName;
  final String flavorUrl;
  final String packageName;
  final String searchTerm;

  FlavorConfig({
    required this.flavorName,
    required this.flavorUrl,
    required this.packageName,
    required this.searchTerm,
  });

  factory FlavorConfig.fromFlavor(AppFlavors flavor) {
    switch (flavor) {
      case AppFlavors.theSimpsons:
        return FlavorConfig(
          flavorName: 'simpsons',
          flavorUrl:
              'http://api.duckduckgo.com/?q=simpsons+characters&format=json',
          packageName: 'com.sample.simpsonsviewer',
          searchTerm: 'simpsons characters',
        );
      case AppFlavors.theWire:
        return FlavorConfig(
          flavorName: 'the wire',
          flavorUrl:
              'https://api.duckduckgo.com/?q=the+wire+characters&format=json',
          packageName: 'com.sample.wireviewer',
          searchTerm: 'the wire characters',
        );
    }
  }
}
