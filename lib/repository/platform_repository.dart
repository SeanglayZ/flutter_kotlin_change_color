import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class PlatformRepository {
  static const platform = MethodChannel('seanglay/helper');
  Future<String> changeColor(String color) async {
    try {
      final String result =
          await platform.invokeMethod('changeColor', {"color": color});
      debugPrint('Result : $result');
      color = result;
    } on PlatformException catch (e) {
      debugPrint('$e');
    }
    return color;
  }
}
