import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class SurasListView extends StatelessWidget {
  const SurasListView({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemBuilder:
                (context, index) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Al-Fatiha',
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '7 Verses  ',
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    'الفاتحه',
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
                        (index + 1).toString(),
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize:
                              (index + 1) > 99
                                  ? 8
                                  : (index + 1) > 9
                                  ? 14
                                  : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (BuildContext context, int index) {
              return Divider(indent: 65, endIndent: 65,color: AppColor.goldColor,);
            },
            itemCount: 10,
            scrollDirection: Axis.vertical,
          ),
        ],
      ),
    );
  }
}
