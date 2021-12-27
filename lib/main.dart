import 'package:flutter/material.dart';
import 'package:spacex_missions/application.dart';
import 'package:spacex_missions/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const Application());
}
