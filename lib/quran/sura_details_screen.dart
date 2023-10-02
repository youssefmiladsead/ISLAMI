import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/quran/item_sura_details.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routename = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> versr = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    loadFile(args.index);

    return Stack(children: [
      provider.appTheme == ThemeMode.dark
          ? Image.asset('assets/image/BackGround_Dark.png',
              width: double.infinity, height: double.infinity, fit: BoxFit.fill)
          : Image.asset('assets/image/background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('${args.name}',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: versr.length == 0
            ? Center(child: CircularProgressIndicator())
            : Container(
                decoration: BoxDecoration(
                  color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.width * 0.08),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Color(0xffB7935F),
                thickness: 1,
              );
            },
            itemBuilder: ((context, index) {
              return ItemSuraDetails(
                content: versr[index],
                index: index,
              );
            }),
            itemCount: versr.length,
          ),
        ),
      )
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    versr = lines;
    setState(() {});
    print(lines);
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
