import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sun/config/theme/theme_manager.dart';
import 'package:islami_app_c14_online_sun/core/routes_manager.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes,
        initialRoute: RoutesManager.mainLayout,
        theme: ThemeManager.light);
  }
}
