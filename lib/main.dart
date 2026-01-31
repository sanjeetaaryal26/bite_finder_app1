import 'package:bite_finder_app/app.dart';
import 'package:bite_finder_app/core/services/hive_service.dart';
import 'package:bite_finder_app/core/services/storage/user_session_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  await HiveService().init();
  await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
    child: MyApp()));
}
