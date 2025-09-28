import 'package:flutter/material.dart';

import 'package:islami/screens/main_layer.dart';
import 'package:islami/tabs/quran_tab/widgets/sura_details.dart';
import 'package:islami/themes/app_routes.dart';
import 'package:islami/themes/app_theme.dart';
import 'splash_screen.dart';

void main() {
  runApp(islami());
}

class islami extends StatelessWidget {
  const islami({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'islami',
      theme: AppTheme.appTheme,
      initialRoute: AppRoutes.mainLayer,
      routes: {
        AppRoutes.splashscreen: (context) => SplashScreen(),
        AppRoutes.mainLayer: (context) => MainLayer(),
        AppRoutes.suraDetails: (context) => SuraDetails(),
      },
    );
  }
}
