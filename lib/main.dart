import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sun/core/prefs_manager/prefs_manager.dart';
import 'package:islami_app_c14_online_sun/islami_app.dart';

void main() async {
  /// configurations
  /// initialize
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const IslamiApp());
}
