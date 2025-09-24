import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/themes/app_routes.dart';

import '../common/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
    //  Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AppConst.background, fit: BoxFit.cover),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(),
                Image.asset(AppConst.smallMosque),
                Spacer(),
                SvgPicture.asset(AppConst.first_mosque),
                SvgPicture.asset(AppConst.islamiImage),
                Spacer(),
                Image.asset(AppConst.routeImage, width: 200, height: 200),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    AppConst.shapeimage2,
                    width: 87,
                    height: 187,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppConst.shapeimage1, width: 87, height: 187),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
