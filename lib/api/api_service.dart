import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/home/radio_tab_widget/radio_model.dart';

class ApiService {
  static Future<RadioModel?> getRadios() async {
    var url = Uri.https('mp3quran.net', '/api/v3/radios', {'language': 'eng'});
    var responce = await http.get(url);

    if (responce.statusCode == 200) {
      var json = jsonDecode(responce.body);
      print(responce.body);
      return RadioModel.fromJson(json);
    }
  }
}
