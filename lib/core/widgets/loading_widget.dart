import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sun/core/colors_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorsManager.gold,
      ),
    );
  }
}
