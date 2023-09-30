import 'package:flutter/material.dart';
import 'package:islami/Hadeth/hadeth_tap.dart';
import 'package:islami/quran/quran_tab.dart';
import 'package:islami/radio_tap.dart';
import 'package:islami/tasbeh_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int Selectefindex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/image/background.png',
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title:
                Text('ISLAMI', style: Theme.of(context).textTheme.titleLarge),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Color(0xffB7935F)),
            child: BottomNavigationBar(
              currentIndex: Selectefindex,
              onTap: (index) {
                Selectefindex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/image/quran@1.png'),
                    ),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/image/book@1.png'),
                    ),
                    label: 'Hades'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/image/sebha@1.png'),
                    ),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/image/radio@1.png'),
                    ),
                    label: 'Radio'),
              ],
            ),
          ),
          body: tabs[Selectefindex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
  ];
}
