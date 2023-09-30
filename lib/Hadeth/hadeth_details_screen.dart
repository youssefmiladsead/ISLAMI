import 'package:flutter/material.dart';
import 'package:islami/Hadeth/item_hadeth_details.dart';

import 'hadeth_tap.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routename = 'hadeth_details';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
      Image.asset('assets/image/background.png',
          width: double.infinity, height: double.infinity, fit: BoxFit.fill),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('${args.title}',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.width * 0.08),
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return ItemHadethDetails(content: args.content[index]);
              //علشان يجيبلي الاسترينج بس لاني ال كونتينت دي ليست
            }),
            itemCount: args.content.length,
          ),
        ),
      )
    ]);
  }
}
