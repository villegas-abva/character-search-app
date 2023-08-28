import 'package:flutter/material.dart';

enum DeviceType {
  phone,
  tablet,
}

class DeviceInfo {
  static DeviceType getDeviceType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // horizontally, 600 pixes is a decent way of differentiating a phone from a tablet
    if (width >= 600) {
      return DeviceType.tablet;
    } else {
      return DeviceType.phone;
    }
  }
}
