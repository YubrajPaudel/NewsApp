import 'dart:convert';
import 'package:http/http.dart';
import '../model/article_model.dart';

class ApiService {
  final endPointUrl = Uri.parse(
    'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7627820151f049d6aac622aafbf6a8b7',
  );

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      print(body);

      List<Article> contents = body
          .map(
            (dynamic item) => Article.fromJson(item),
          )
          .toList();
      return contents;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
