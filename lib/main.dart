import 'package:flutter/material.dart';
import 'package:islami/Hadeth/hadeth_details_screen.dart';
import 'package:islami/Home_Screen.dart';
import 'package:islami/My_Them.dart';
import 'package:islami/quran/sura_details_screen.dart';

void main() {
  runApp(Islami());
}

class Islami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routename,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        SuraDetailsScreen.routename: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routename: (context) => HadethDetailsScreen()
      },
      theme: MyTheme.lightTheme,
    );
  }
}
