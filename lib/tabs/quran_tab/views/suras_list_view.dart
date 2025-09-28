import 'package:flutter/material.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/themes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/const.dart';
import '../../../themes/app_colors.dart';

class SurasListView extends StatelessWidget {
  const SurasListView({super.key, required this.searchText, required this.onNav});
  final String searchText;
  final void Function() onNav;
  @override
  Widget build(BuildContext context) {
    List<SuraModel> suras =
        SuraModel.getSuraList
            .where(
              (element) =>
                  element.arName.contains(searchText) ||
                  element.enName.toLowerCase().contains(
                    searchText.toLowerCase(),
                  ),
            )
            .toList();
    // List<SuraModel> suras =[];
    // for(int i = 0; i <SuraModel.getSuraList.length;i++){
    //   if(SuraModel.getSuraList[i].arName.contains(searchText)) {
    //     suras.add(SuraModel.getSuraList[i]);
    //   }
    //}
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'Suras List',
            style: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              SuraModel currentSura = suras[index];
              return ListTile(
                onTap: () {
                  cashSuraToList(currentSura.index).then((value) {
                    onNav();
                  },);

                  Navigator.of(
                    context,
                  ).pushNamed(AppRoutes.suraDetails, arguments: currentSura);
                },
                contentPadding: EdgeInsets.zero,
                title: Text(
                  currentSura.enName,
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '${currentSura.versesCount} Verses  ',
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  currentSura.arName,
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Stack(
                  alignment: Alignment(0, 0),
                  children: [
                    Icon(
                      Icons.brightness_5,
                      color: AppColor.whiteColor,
                      size: 45,
                    ),
                    Text(
                      currentSura.index.toString(),
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize:
                            (currentSura.index + 1) > 99
                                ? 8
                                : (currentSura.index + 1) > 9
                                ? 14
                                : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                indent: 65,
                endIndent: 65,
                color: AppColor.goldColor,
              );
            },
            itemCount: suras.length,
            scrollDirection: Axis.vertical,
          ),
        ],
      ),
    );
  }

Future  cashSuraToList(int index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> data = pref.getStringList(AppConst.mostRecent) ?? [];
    Set<String> temp = data.toSet();
    data = temp.toList();
    data.remove(index.toString());
    data.add(index.toString());
    pref.setStringList(AppConst.mostRecent, data );
  }
}
