import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/home/ahadeth_tab_widget/hadeth_title_widget.dart';

import 'hadeth_model.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethItem> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) loadHadethFile();

    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/ahadeth_image.png',
            )),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: Color(0xffB7935F), width: 2))),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              textAlign: TextAlign.center,
              'الاحاديث',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: allAhadeth.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => HadethTitleWidget(
                          hadethItem: allAhadeth[index],
                        ),
                    itemCount: allAhadeth.length))
      ],
    );
  }

  void loadHadethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethList = fileContent.trim().split('#');
    for (int i = 0; i < ahadethList.length; i++) {
      String singleHadeth = ahadethList[i];
      List<String> ahadethLines = singleHadeth.trim().split('\n');
      String hadethTitle = ahadethLines[0];
      ahadethLines.removeAt(0);
      String hadethContent = ahadethLines.join('\n');

      HadethItem h = HadethItem(content: hadethContent, title: hadethTitle);
      allAhadeth.add(h);
    }
    setState(() {});
  }
}
