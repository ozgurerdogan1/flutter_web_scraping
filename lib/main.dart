import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final kitapYurdUrl =
      "https://www.kitapyurdu.com/index.php?route=product/category&filter_category_all=true&path=1_2&filter_in_stock=1&sort=publish_date&order=DESC&limit=100";

  final ogretmenlerUrl = "https://globalogretmen.com/okul-oncesi";

  @override
  void initState() {
    //getWebSiteDataKitapYurdu();
    getWebSiteDataOgretmenler();
    super.initState();
  }

  Future getWebSiteDataKitapYurdu() async {
    final url = Uri.parse(kitapYurdUrl);
    Response res = await http.get(url);
    if (res.statusCode == 200) {
      final document = parser.parse(res.body);
      /* final getBookNameList = document.body
          ?.getElementsByClassName("product-grid")[0]
          .getElementsByClassName("product-cr")
          .map((e) => e.children[3].text)
          .toList();

      final publisher = document.body
          ?.getElementsByClassName("product-grid")[0]
          .getElementsByClassName("product-cr")
          .map((e) => e.children[4].text)
          .toList();

      final author = document.body
          ?.getElementsByClassName("product-grid")[0]
          .getElementsByClassName("product-cr")
          .map((e) => e.children[5].text)
          .toList(); */

      /*   final price = document.body
          ?.getElementsByClassName("product-grid")[0]
          .getElementsByClassName("product-cr")
          .map((e) => e.children[8].text)
          .toList(); */

      /* final img = document.body
          ?.getElementsByClassName("product-grid")[0]
          .getElementsByClassName("product-cr")
          .map((e) => e.children[2].children[0].children[0].children[0].attributes["src"])
          .toList(); */

      final result = document.body
          ?.getElementsByClassName("product-grid")[0]
          .getElementsByClassName("product-cr")
          .map((e) => e.children[2].children[0].children[0].children[0].attributes["src"])
          .toList();

      print(result);
    } else {
      print("error status code: ${res.statusCode}");
    }
  }

  Future getWebSiteDataOgretmenler() async {
    final url = Uri.parse(ogretmenlerUrl);
    Response res = await http.get(url);
    if (res.statusCode == 200) {
      final document = parser.parse(res.body);

      final cardElement = document.body?.children[6].children[0].children[1].children[0].children[0]
          .children[0].children[2].children[0].children[0].children[0].attributes["src"];

      /*   final imageList =
          cardElement.children[2].children[0].children[0].children[0].attributes["src"];
           */
      print(cardElement);
    } else {
      print("error status code: ${res.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Scraping',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wep Scraping'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
