import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/common/const.dart';
import 'package:islami/tabs/quran_tab/views/most_recent_view.dart';
import 'package:islami/tabs/quran_tab/views/suras_list_view.dart';
import 'package:islami/tabs/quran_tab/widgets/cost_text_field.dart';
import 'package:islami/themes/app_colors.dart';
import 'package:islami/widgets/main_header.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppConst.quranTab),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.blackColor.withValues(alpha: .7),
                AppColor.blackColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              spacing: 10,
              children: [
                MainHeader(),
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
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [MostRecentView(), SurasListView()]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
