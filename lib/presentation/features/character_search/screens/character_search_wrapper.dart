import 'package:character_search_app/presentation/device_type.dart';
import 'package:character_search_app/presentation/features/character_search/screens/phone/character_search_phone_screen.dart';
import 'package:character_search_app/presentation/features/character_search/screens/tablet/chracter_search_tablet_screen.dart';
import 'package:flutter/material.dart';

class CharacterSearchWrapper extends StatelessWidget {
  /// Returns either the [CharacterSearchPhoneScreen] or [CharacterSearchTabletScreen] depending on the
  /// device's screen width, taking 600 pixels as the magic number for this distinction.
  const CharacterSearchWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = DeviceInfo.getDeviceType(context);
    bool isPhone = deviceType == DeviceType.phone;

    return isPhone
        ? const CharacterSearchPhoneScreen()
        : const CharacterSearchTabletScreen();
  }
}
