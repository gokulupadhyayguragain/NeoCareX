import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themeBoxName = 'theme_settings';
  static const String _themeModeKey = 'theme_mode';

  ThemeCubit() : super(ThemeMode.system) {
    _loadTheme();
  }

  void _loadTheme() async {
    final box = await Hive.openBox(_themeBoxName);
    final savedTheme = box.get(_themeModeKey, defaultValue: 'system');
    
    switch (savedTheme) {
      case 'light':
        emit(ThemeMode.light);
        break;
      case 'dark':
        emit(ThemeMode.dark);
        break;
      default:
        emit(ThemeMode.system);
    }
  }

  void toggleTheme() async {
    final box = await Hive.openBox(_themeBoxName);
    
    switch (state) {
      case ThemeMode.light:
        emit(ThemeMode.dark);
        await box.put(_themeModeKey, 'dark');
        break;
      case ThemeMode.dark:
        emit(ThemeMode.system);
        await box.put(_themeModeKey, 'system');
        break;
      case ThemeMode.system:
        emit(ThemeMode.light);
        await box.put(_themeModeKey, 'light');
        break;
    }
  }

  String get currentThemeText {
    switch (state) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }
}
