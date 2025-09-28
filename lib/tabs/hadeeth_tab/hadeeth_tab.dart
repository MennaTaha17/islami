import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/hadeeth_model.dart';
import 'package:islami/widgets/main_bg_widget.dart';
import 'package:islami/widgets/main_header.dart';

import '../../common/const.dart';
import '../../themes/app_colors.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<HadeethModel> dataList = [];
  PageController controller = PageController(
    viewportFraction: .8,
    initialPage: 0,
  );
  int currentPage = 0;
  @override
  void initState() {
    controller.addListener(() {
      if ((controller.page ?? 0).toInt() != currentPage) {
        setState(() {
          currentPage = (controller.page ?? 0).toInt();
        });
      }
    });
    loadHadeeth();
  }

  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: AppConst.hadeethTab,
      child: Expanded(
        child: PageView.builder(
          controller: controller,
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            HadeethModel hadeeth = dataList[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: index != currentPage ? 20.0 : 0,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                padding: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColor.goldColor,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(AppConst.hadeethBg, fit: BoxFit.fill),
                    Column(
                      children: [
                        SizedBox(height: 42),
                        Text(
                          hadeeth.title,
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                              hadeeth.content,
                              style: TextStyle(
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 100,),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> loadHadeeth() async {
    List<HadeethModel> ahadeethList = [];
    ahadeethList.clear();
    for (int i = 1; i < 50; i++) {
      String result = await rootBundle.loadString('assets/Hadeeth/h$i.txt');

      String title = result.split('\n').first.trim();
      String content = result.substring(title.length).trim();
      print('---> ${title}');
      print('---> ${content}');

      HadeethModel hadeethModel = HadeethModel(
        title: title,
        content: content,
        index: 1,
      );
      ahadeethList.add(hadeethModel);
    }
    setState(() {
      dataList = ahadeethList;
    });
  }
}
