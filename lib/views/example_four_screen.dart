import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice_working_with_api/Components/row_for_card.dart';
import 'package:http/http.dart' as http;

class ExampleFourScreen extends StatefulWidget {
  const ExampleFourScreen({super.key});

  static const String screen_id = 'ExampleFourScreen';

  @override
  State<ExampleFourScreen> createState() => _ExampleFourScreenState();
}

class _ExampleFourScreenState extends State<ExampleFourScreen> {
  var data; // without creating the model, dynamically fetching data without model. // this is kind of hack

  Future<void> getUserApi() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {

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
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  } else {
                    // return Text(data[0]['name'].toString());
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                RowForCard(
                                  title: 'Name',
                                  value: data[index]['name'].toString(),
                                ),
                                RowForCard(
                                  title: 'email',
                                  value: data[index]['email'].toString(),
                                ),
                                RowForCard(
                                  title: 'Address',
                                  value: ' ${data[index]['address']['street'].toString()} , ${data[index]['address']['city'].toString()}',
                                ),
                                RowForCard(
                                  title: 'Location',
                                  value: ' ${data[index]['address']['geo']['lat'].toString()} , ${data[index]['address']['geo']['lng'].toString()}',
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}
