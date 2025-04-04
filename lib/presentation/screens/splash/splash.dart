import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sun/core/assets_manager.dart';
import 'package:islami_app_c14_online_sun/core/colors_manager.dart';
import 'package:islami_app_c14_online_sun/core/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  void navigate() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 4, child: Image.asset(AssetsManager.splashLogo)),
          Expanded(child: Image.asset(AssetsManager.branding)),
        ],
      ),
    );
  }
}
