import 'package:flutter/material.dart';
import 'package:quran_app/home/quran_tab_widget/ChapterTitleWidget.dart';

class QuranTab extends StatelessWidget {

   List<String>  suraNames=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {
    return  Container(

      color: Colors.transparent,
      child: Column(

        children: [
          Expanded(
              flex: 1,
              child: Image.asset('assets/images/quran_header_image.png')),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            height: 2,
            color: const Color(0xffB7935F),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: const Text('Chapter Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            height: 2,
            color: const Color(0xffB7935F),
          ),
          Expanded(
            flex: 3,
            child: ListView.separated(itemBuilder:(context,index)=>ChapterTitleWidget(chapterTitle:suraNames[index],index: index,) ,
                separatorBuilder: (context,index)=>Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  width: double.infinity,
                  height: 2,
                  color: const Color(0xffB7935F),
                ),
                itemCount: suraNames.length),
          )
        ],

      ),
    );
  }
}
