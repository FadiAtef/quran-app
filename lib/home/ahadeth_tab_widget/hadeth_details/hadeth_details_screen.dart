import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/ahadeth_tab_widget/hadeth_model.dart';
import 'package:quran_app/home/core/settings_provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'Hadeth-Details';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    HadethItem args = ModalRoute.of(context)?.settings.arguments as HadethItem;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(provider.getHomeBackground()),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'اسلامي',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 80),
          padding: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? Color(0xff151B31).withOpacity(0.8)
                : Color(0xffF8F8F8).withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  args.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Divider(
                color: Color(0xffB7935F),
                thickness: 1,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) => Text(
                    args.content,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  itemCount: args.content.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
