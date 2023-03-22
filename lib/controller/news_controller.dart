import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saqwqw/model/news.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 1.obs;
  getData(String category) async {
    final url = Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=eg&category=${category}&apiKey=');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        return Articles.fromJson(jsonDecode(response.body));
      } catch (error) {
        Get.snackbar("error", error.toString());
      }
    }
  }
}
