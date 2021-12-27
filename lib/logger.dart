import 'package:flutter/foundation.dart';

class Logger {
  static void d(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }
}
