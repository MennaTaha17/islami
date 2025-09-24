import 'package:flutter/cupertino.dart';
import '../common/const.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Image.asset(
        AppConst.mainHeader,
        width: 300,
        height: 140,
        fit: BoxFit.cover,
      ),
    );
  }
}
