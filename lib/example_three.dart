import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice_working_with_api/Models/user_model.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
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
        title: Text('Example 3'),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
