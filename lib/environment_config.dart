// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class EnvironmentConfig {
//   // We add the api key by running 'flutter run --dart-define=movieApiKey=MYKEY
//   final movieApiKey = const String.fromEnvironment("movieApiKey");
// }

// final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
//   return EnvironmentConfig();
// });

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnvironmentConfig {
  String movieApiKey;

  EnvironmentConfig(this.movieApiKey);

  static Future<EnvironmentConfig> load() async {
    final String configString =
        await rootBundle.loadString('assets/config.json');
    final Map<String, dynamic> configJson = jsonDecode(configString);
    return EnvironmentConfig(configJson['movieApiKey']);
  }
}

final environmentConfigProvider =
    FutureProvider<EnvironmentConfig>((ref) async {
  return EnvironmentConfig.load();
});

