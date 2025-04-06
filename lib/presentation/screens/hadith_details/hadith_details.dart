import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sun/core/assets_manager.dart';
import 'package:islami_app_c14_online_sun/core/colors_manager.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/main_layout/tabs/hadith_tab/widgets/hadith_card.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/main_layout/tabs/hadith_tab/widgets/hadith_content.dart';

class HadithDetails extends StatefulWidget {
  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  late HadithDetailsArgs arguments;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    arguments = ModalRoute.of(context)?.settings.arguments as HadithDetailsArgs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hadith ${arguments.index}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AssetsManager.quranDetailsPatterLeft),
                    Image.asset(AssetsManager.quranDetailsPatterRight),
                  ],
                ),
                Text(
                  arguments.hadithDM.title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.gold),
                )
              ],
            ),
            Expanded(
                child: HadithContent(
              content: arguments.hadithDM.content,
              contentColor: ColorsManager.gold,
            )),
          ],
        ),
      ),
    );
  }
}
