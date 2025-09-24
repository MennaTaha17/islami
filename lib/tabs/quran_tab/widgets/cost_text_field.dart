import 'package:flutter/material.dart';
import 'package:islami/common/const.dart';
import 'package:islami/themes/app_colors.dart';

class CostTextField extends StatelessWidget {
  const CostTextField({super.key, this.hintText, this.prefixIcon});
 final String? hintText;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColor.goldColor,
      style: TextStyle(
        color: AppColor.whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        fontFamily: AppConst.fontFamily,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.blackColor.withValues(alpha: .7),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: prefixIcon,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.whiteColor.withValues(alpha: .5),
          fontWeight: FontWeight.normal,
          fontSize: 16,
          fontFamily: AppConst.fontFamily,
        ),
        border: _getBorder(),
        focusedBorder: _getBorder(),
        enabledBorder: _getBorder(),
      ),
    );
  }
  OutlineInputBorder  _getBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.goldColor),
    );
  }
}


