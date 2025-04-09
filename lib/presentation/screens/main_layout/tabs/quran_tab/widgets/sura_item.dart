import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sun/core/assets_manager.dart';
import 'package:islami_app_c14_online_sun/core/colors_manager.dart';
import 'package:islami_app_c14_online_sun/core/constant_manager.dart';
import 'package:islami_app_c14_online_sun/core/routes_manager.dart';

class SuraItem extends StatefulWidget {
  const SuraItem({super.key, required this.suraDM});

  final SuraDM suraDM;

  @override
  State<SuraItem> createState() => _SuraItemState();
}

class _SuraItemState extends State<SuraItem> {
  void _onSuraItemClicked() {
    Navigator.pushNamed(context, RoutesManager.quranDetails,
        arguments: QuranDetailsArguments(
            suraNameEn: widget.suraDM.suraNameEn,
            suraNameAr: widget.suraDM.suraNameAr,
            suraIndex: widget.suraDM.suraIndex));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onSuraItemClicked,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.suraNumberBackground),
              Text(
                "${widget.suraDM.suraIndex}",
                style: TextStyle(
                    fontSize: 14,
                    color: ColorsManager.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            children: [
              Text(
                widget.suraDM.suraNameEn,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ColorsManager.white),
              ),
              Text(
                widget.suraDM.versesNumber,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorsManager.white),
              )
            ],
          ),
          Spacer(),
          Text(
            widget.suraDM.suraNameAr,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ColorsManager.white),
          ),
        ],
      ),
    );
  }
}

class QuranDetailsArguments {
  final String suraNameEn;
  final String suraNameAr;
  final String suraIndex;

  QuranDetailsArguments(
      {required this.suraNameEn,
      required this.suraNameAr,
      required this.suraIndex});
}
