import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/common/const.dart';
import 'package:islami/tabs/quran_tab/views/most_recent_view.dart';
import 'package:islami/tabs/quran_tab/views/suras_list_view.dart';
import 'package:islami/tabs/quran_tab/widgets/cost_text_field.dart';
import 'package:islami/themes/app_colors.dart';
import 'package:islami/widgets/main_bg_widget.dart';
import 'package:islami/widgets/main_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.text.length > 1) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: AppConst.quranTab,
      child: Expanded(
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CostTextField(
                hintText: "Sura name",
                prefixIcon: SvgPicture.asset(
                  AppConst.quranIcon,
                  colorFilter: ColorFilter.mode(
                    AppColor.goldColor,
                    BlendMode.srcIn,
                  ),
                ),
                controller: controller,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MostRecentView(),
                    SurasListView(
                      searchText: controller.text,
                      onNav: () => setState(() {}),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
