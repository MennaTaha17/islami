import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/common/common_decorations.dart';
import 'package:islami/common/const.dart';
import 'package:islami/tabs/hadeeth_tab/hadeeth_tab.dart';
import 'package:islami/tabs/quran_tab/quran_tab.dart';
import 'package:islami/themes/app_colors.dart';

class MainLayer extends StatefulWidget {
  const MainLayer({super.key});

  @override
  State<MainLayer> createState() => _MainLayerState();
}

class _MainLayerState extends State<MainLayer> {
  int currentTab = 0;
  List<Widget> tab = [
   QuranTab(),
    HadeethTab(),
    Container(color: AppColor.goldColor),
    Container(color: AppColor.grayColor),
    Container(color: AppColor.brownColor),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (value) {
          setState(() {
            currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration:
                  currentTab == 0
                      ? CommonDeecorations.selectedItemDecoration
                      : null,
              child: SvgPicture.asset(
                AppConst.quranIcon,
                width: currentTab == 0 ? 20 : 25,
                color: currentTab == 0 ? AppColor.whiteColor : null,
              ),
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration:
                  currentTab == 1
                      ? CommonDeecorations.selectedItemDecoration
                      : null,
              child: SvgPicture.asset(
                AppConst.hadeethIcon,
                width: currentTab == 1 ? 20 : 25,
                color: currentTab == 1 ? AppColor.whiteColor : null,
              ),
            ),
            label: 'Hadeeth',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration:
                  currentTab == 2
                      ? CommonDeecorations.selectedItemDecoration
                      : null,
              child: SvgPicture.asset(
                AppConst.sebhaIcon,
                width: currentTab == 2 ? 20 : 25,
                color: currentTab == 2 ? AppColor.whiteColor : null,
              ),
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration:
                  currentTab == 3
                      ? CommonDeecorations.selectedItemDecoration
                      : null,
              child: SvgPicture.asset(
                AppConst.radioIcon,
                width: currentTab == 3 ? 20 : 25,
                color: currentTab == 3 ? AppColor.whiteColor : null,
              ),
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration:
                  currentTab == 4
                      ? CommonDeecorations.selectedItemDecoration
                      : null,
              child: SvgPicture.asset(
                AppConst.timeIcon,
                width: currentTab == 4 ? 20 : 25,
                color: currentTab == 4 ? AppColor.whiteColor : null,
              ),
            ),
            label: 'Time',
          ),
        ],
      ),
      body: tab[currentTab],
    );
  }
}
