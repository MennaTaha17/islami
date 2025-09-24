import 'package:flutter/material.dart';
import 'package:islami/common/const.dart';
import 'package:islami/themes/app_colors.dart';

class MostRecentView extends StatelessWidget {
  const MostRecentView({super.key});

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
                (context, index) => SizedBox(
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
                                  'Al-Anbiya',
                                  style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'الأنبياء',
                                  style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '112 Verses  ',
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
                ),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
