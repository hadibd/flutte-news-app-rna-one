import 'package:flutter/material.dart';

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
          Expanded(child: ListView.builder(itemBuilder: (contxt, index) {
            return Card(
                child: ListTile(
              leading: Image.asset('assets/images/logo.png'),
              title: Text(
                'This is an example of news headline of new api',
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text('Author: Jack and Rose'),
            ));
          }))
        ],
      ),
    ));
  }
}
