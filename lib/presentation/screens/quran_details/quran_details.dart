import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_c14_online_sun/core/assets_manager.dart';
import 'package:islami_app_c14_online_sun/core/colors_manager.dart';
import 'package:islami_app_c14_online_sun/core/widgets/loading_widget.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/main_layout/tabs/quran_tab/widgets/sura_item.dart';
import 'package:islami_app_c14_online_sun/presentation/screens/quran_details/widgets/quran_content.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  late QuranDetailsArguments arguments;
  String suraContent = "";

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    arguments =
        ModalRoute.of(context)?.settings.arguments as QuranDetailsArguments;
    loadSuraContent(arguments.suraIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.suraNameEn),
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
                  arguments.suraNameAr,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.gold),
                )
              ],
            ),
            Expanded(
                child: suraContent.isEmpty
                    ? const LoadingWidget(
                        color: ColorsManager.gold,
                      )
                    : QuranContent(content: suraContent)),
          ],
        ),
      ),
    );
  }

  void loadSuraContent(String suraIndex) async {
    String key = "assets/files/suras/$suraIndex.txt";
    String fileContent = await rootBundle.loadString(key);
    List<String> fileContentLines = fileContent.trim().split("\n");

    for (int i = 0; i < fileContentLines.length; i++) {
      fileContentLines[i] = "${fileContentLines[i]}[${i + 1}]";
    }
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      suraContent = fileContentLines.join();
    });
  }
}
