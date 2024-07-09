import 'package:flutter/material.dart';
import 'package:quran_app/home/ahadeth_tab_widget/hadeth_details/hadeth_details_screen.dart';
import 'package:quran_app/home/ahadeth_tab_widget/hadeth_model.dart';

class HadethTitleWidget extends StatelessWidget {
  HadethItem hadethItem;
  HadethTitleWidget({required this.hadethItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadethItem);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(6),
        child: Text(
          hadethItem.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
    );
  }
}
