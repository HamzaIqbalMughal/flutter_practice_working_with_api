import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_practice_working_with_api/Models/posts_model.dart';

class ExampleOne extends StatefulWidget {

  const ExampleOne({super.key});

  static const String screen_id = 'ExampleOne';

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  String url = 'https://jsonplaceholder.typicode.com/posts';

  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context)!.settings.arguments as Map ;  // this is to catch the arguments passed while using pushNamed()

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Example 1',
          // arguments.toString(),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: Text(arguments.toString()),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  // return Text('Loading');
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      strokeWidth: 10,
                      strokeAlign: 10,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      // return Text(index.toString());
                      // return Text(postList[index].title.toString());
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: RichText(
                            text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Title\n',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: postList[index].title.toString() +
                                          '\n'),
                                  TextSpan(
                                      text: 'Body\n',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: postList[index].body.toString()),
                                ]),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
