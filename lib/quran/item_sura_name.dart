import 'package:flutter/material.dart';
import 'package:islami/My_Them.dart';
import 'package:islami/quran/sura_details_screen.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class ItemSuraName extends StatelessWidget {
  String name;
  int index;

  ItemSuraName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routename,
            arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Text(
        name,
        style: provider.appTheme == ThemeMode.dark
            ? Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.whiteColor)
            : Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}

//الدوسة علي الصورة
