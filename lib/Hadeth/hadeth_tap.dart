import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Hadeth/item_hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset('assets/image/ahadeth_image.png')),
        Divider(
          color: Color(0xffB7935F),
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: Color(0xffB7935F),
          thickness: 3,
        ),
        ahadethList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : Expanded(
                flex: 3,
                //بنعملها في اكسبندد علشان تعرف تتحرك في محيط معين
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ItemHadethName(
                      hadeth: ahadethList[index],
                    );
                    //ناكسس ال list
                  },
                  itemCount: ahadethList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: Color(0xffB7935F),
                      thickness: 1,
                    );
                  },
                ),
              ),
      ],
    );
  }

  void loadHadethFile() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    //هنقطع كل حديث لوحده
    List<String> hadethList = ahadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      //هنقطع الحديث الواحد ل عنوان ومحتوي
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      // علشان املي الليست اللي فوق
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
