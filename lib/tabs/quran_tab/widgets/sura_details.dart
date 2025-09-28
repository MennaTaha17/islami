import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/common/const.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/themes/app_colors.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayatList = [];
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
   if(ayatList.isEmpty) loadSura(suraModel.index);
    return Scaffold(
      appBar: AppBar(title: Text(suraModel.enName)),
      body: Stack(
        alignment: Alignment(0, 0),
        children: [
          Image.asset(AppConst.suraDetailsBg, fit: BoxFit.cover),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                suraModel.arName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.goldColor,
                ),
              ),
              SizedBox(height: 42),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        ...ayatList.asMap().entries.map(
                          (entry) => TextSpan(
                            text: entry.value + '[${entry.key + 1}]',
                          ),
                        ),
                      ],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.goldColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loadSura(int index) async {
    String res = await rootBundle.loadString('assets/Suras/$index.txt');
    setState(() {

      ayatList = res.trim().split('\n');
    });
  }
}
