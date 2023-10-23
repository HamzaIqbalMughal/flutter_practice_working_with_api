import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice_working_with_api/Models/user_model.dart';
import 'package:http/http.dart' as http;

import 'Components/row_for_card.dart';

class ExampleThreeScreen extends StatefulWidget {
  const ExampleThreeScreen({super.key});

  static const String screen_id = 'ExampleThree';

  @override
  State<ExampleThreeScreen> createState() => _ExampleThreeScreenState();
}

class _ExampleThreeScreenState extends State<ExampleThreeScreen> {
  List<UserModel> userList = [];

  String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UserModel>> getUsers() async {
    final response = await http.get(Uri.parse(url));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Example 3',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              RowForCard(
                                title: 'Name: ',
                                value: snapshot.data![index].name.toString(),
                              ),
                              RowForCard(
                                title: 'Email: ',
                                value: snapshot.data![index].email.toString(),
                              ),
                              RowForCard(
                                title: 'Address: ',
                                value: snapshot.data![index].address!.city.toString(),
                              ),
                              RowForCard(
                                title: 'Location: ',
                                value: '${snapshot.data![index].address!.geo!.lat} , ${snapshot.data![index].address!.geo!.lng}',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      strokeWidth: 10,
                      strokeAlign: 10,
                    ),
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

