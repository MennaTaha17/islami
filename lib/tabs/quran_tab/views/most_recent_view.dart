import 'package:flutter/material.dart';
import 'package:islami/common/const.dart';
import 'package:islami/themes/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/sura_model.dart';

class MostRecentView extends StatefulWidget {
  const MostRecentView({super.key});

  @override
  State<MostRecentView> createState() => _MostRecentViewState();
}

class _MostRecentViewState extends State<MostRecentView> {
  List<SuraModel> mostRecent = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
loadMostRecent();
  }
  @override
  void didUpdateWidget(covariant MostRecentView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    loadMostRecent();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Most Recently',
            style: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20),
            itemBuilder:
                (context, index) {
                  SuraModel sura = mostRecent[index];
                  return SizedBox(
                  width: 280,
                  child: Card(
                    color: AppColor.goldColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 7,
                        bottom: 7,
                        right: 7,
                        left: 20,
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  sura.enName,
                                  style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  sura.arName,
                                  style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${sura.versesCount} Verses  ',
                                  style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Image.asset(AppConst.mostRecent),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                },
            scrollDirection: Axis.horizontal,
            itemCount: mostRecent.length,
          ),
        ),
      ],
    );
  }

  loadMostRecent() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> data = pref.getStringList(AppConst.mostRecent) ?? [];
    pref.setStringList(AppConst.mostRecent, data);
    List <SuraModel> suras = data
        .map((e) => SuraModel.getSuraList[int.parse(e)-1])
        .toList();
    setState(() {
      mostRecent = suras.reversed.toList();
    });
  }
}
