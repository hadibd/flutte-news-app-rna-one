import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class DetailsNews extends StatefulWidget {
  const DetailsNews(
      {Key? key,
      required this.title,
      required this.description,
      required this.image,
      required this.author,
      required this.url,
      required this.date})
      : super(key: key);

  final title, description, image, author, date, url;
  @override
  _DetailsNewsState createState() => _DetailsNewsState();
}

class _DetailsNewsState extends State<DetailsNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Image.network(
                widget.image,
                fit: BoxFit.fitHeight,
                width: double.infinity,
                height: 200,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 5),
                child: Text(
                  'Author: ${widget.author}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 5, bottom: 25),
                child: Text(
                  'Date: ${widget.date}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                child: GestureDetector(
                    onTap: () async {
                      await urlLauncher.launch(widget.url);
                    },
                    child: Text('Read more: ${widget.url}')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
