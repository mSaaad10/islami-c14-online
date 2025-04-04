import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sun/core/assets_manager.dart';
import 'package:islami_app_c14_online_sun/core/colors_manager.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/main_layout/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/main_layout/tabs/pray_times_tab/pray_times_tab.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/main_layout/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/main_layout/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/main_layout/tabs/tasbeh_tab/tasbeh_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selecteIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    TasbehTab(),
    RadioTab(),
    PrayTimesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorsManager.black.withOpacity(0),
                ColorsManager.black,
              ]),
          image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AssetsManager.quranTabBackground))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: tabs[selecteIndex],
          bottomNavigationBar: buildBottomNavBar()),
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
        currentIndex: selecteIndex,
        onTap: onItemClicked,
        items: [
          BottomNavigationBarItem(
              icon: buildIcon(
                  isSelected: selecteIndex == 0,
                  iconPath: AssetsManager.quranIcon),
              label: "Quran"),
          BottomNavigationBarItem(
              icon: buildIcon(
                  isSelected: selecteIndex == 1,
                  iconPath: AssetsManager.hadithIcon),
              label: "Hadith"),
          BottomNavigationBarItem(
              icon: buildIcon(
                  isSelected: selecteIndex == 2,
                  iconPath: AssetsManager.sebhaIcon),
              label: "Tasbeh"),
          BottomNavigationBarItem(
              icon: buildIcon(
                  isSelected: selecteIndex == 3,
                  iconPath: AssetsManager.radioIcon),
              label: "Radio"),
          BottomNavigationBarItem(
              icon: buildIcon(
                  isSelected: selecteIndex == 4,
                  iconPath: AssetsManager.timeIcon),
              label: "Time"),
        ]);
  }

  Widget buildIcon({required bool isSelected, required String iconPath}) {
    return isSelected
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
                color: ColorsManager.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(66)),
            child: ImageIcon(AssetImage(iconPath)))
        : ImageIcon(AssetImage(iconPath));
  }

  void onItemClicked(int itemIndex) {
    setState(() {
      selecteIndex = itemIndex;
    });
  }
}
