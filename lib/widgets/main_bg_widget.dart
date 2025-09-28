import 'package:flutter/cupertino.dart';
import 'package:islami/widgets/main_header.dart';

import '../themes/app_colors.dart';

class MainBgWidget extends StatelessWidget {
  const MainBgWidget({super.key, required this.bgImage, required this.child});
  final String bgImage;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
      ),
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
        child: SafeArea(child: Column(
            children: [MainHeader(), child,
            ],
        ),
        ),
      ),
    );
  }
}
