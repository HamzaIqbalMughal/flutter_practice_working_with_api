import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_practice_working_with_api/Models/posts_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<List<PostsModel>>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
