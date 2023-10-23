import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFourScreen extends StatefulWidget {
  const ExampleFourScreen({super.key});

  @override
  State<ExampleFourScreen> createState() => _ExampleFourScreenState();
}

class _ExampleFourScreenState extends State<ExampleFourScreen> {

  var data ;

  Future<void> getUserApi () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode == 200){
      data = json
    }else{

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Example 4',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
