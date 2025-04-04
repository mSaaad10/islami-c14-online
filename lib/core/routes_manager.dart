import 'package:flutter/cupertino.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/main_layout/main_layout.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/quran_details/quran_details.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String mainLayout = "/mainLayout";
  static const String quranDetails = "/quranDetails";
  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const Splash(),
    mainLayout: (_) => const MainLayout(),
    quranDetails: (_) => const QuranDetails(),
  };
}
