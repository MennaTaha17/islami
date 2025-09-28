import 'package:flutter/material.dart';
import 'package:islami/common/const.dart';
import 'package:islami/themes/app_colors.dart';
import 'package:islami/widgets/main_bg_widget.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: AppConst.sebhaTab,
      child: Column(
        children: [
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppConst.sebhaImageBg),
              Column(
                children: [
                  Text(
                    'سبحان الله ',
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                       TextButton(
                        onPressed: () {
                          x++;
                          if(x > 33){
                            x =0;
                          }
                          setState(() {});
                        },
                        child: Text(
                          x.toString(),
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
