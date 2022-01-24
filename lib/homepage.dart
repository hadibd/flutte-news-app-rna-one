import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/details_news.dart';
import 'package:http/http.dart' as http;

import 'const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List catagory = [
    'Econmic',
    'Sports',
    'Entertainment',
    'Cultural',
    'Technology'
  ];

  List newsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 25, bottom: 16),
            child: Text(
              'Latest news',
              style: TextStyle(fontSize: 25, color: Colors.deepPurple),
            ),
          ),
          TextField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        BorderSide(width: 0.5, color: Colors.grey.shade500)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        BorderSide(width: 0.5, color: Colors.grey.shade500)),
                suffixIcon: Icon(Icons.search)),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 35,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10,
                  );
                },
                itemCount: catagory.length,
                itemBuilder: (context, index) {
                  return MaterialButton(
                    minWidth: 80,
                    color: Colors.deepPurple,
                    shape: StadiumBorder(),
                    child: Text(
                      catagory[index],
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  );
                }),
          ),
          Expanded(
            child: newsList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (contxt, index) {
                      return Card(
                          child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsNews(
                                        title: newsList[index]['title'],
                                        description: newsList[index]
                                            ['description'],
                                        image: newsList[index]['urlToImage'],
                                        date: newsList[index]['publishedAt'],
                                        author: newsList[index]['author'],
                                      )));
                        },
                        leading: Image.network(
                          newsList[index]['urlToImage'] ?? image_url,
                          width: 100,
                        ),
                        title: Text(
                          newsList[index]['title'],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                        subtitle: Text('Author: ${newsList[index]['author']}'),
                      ));
                    }),
          )
        ],
      ),
    ));
  }

  getData() async {
    var url =
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=3b1cd13e09c8414ca9fc804c5fa17abb';

    var resposnse = await http.get(Uri.parse(url));
    var data = jsonDecode(resposnse.body);
    var news = data['articles'];

    for (var item in news) {
      setState(() {
        Map map = {
          'author': item['author'],
          'title': item['title'],
          'urlToImage': item['urlToImage'],
          'description': item['description'],
          'publishedAt': item['publishedAt'],
          'url': item['url']
        };

        newsList.add(map);
      });
    }
    print(data);
  }
}
