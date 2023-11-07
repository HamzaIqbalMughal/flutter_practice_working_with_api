import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/dropdown_model.dart';

class DropDownAPIScreen extends StatefulWidget {
  const DropDownAPIScreen({super.key});

  static const String screen_id = 'DropDownAPIScreen';

  @override
  State<DropDownAPIScreen> createState() => _DropDownAPIScreenState();
}

class _DropDownAPIScreenState extends State<DropDownAPIScreen> {

  List<DropDownModel> postsList = [];

  Future<List<DropDownModel>> getPost() async  {
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      var body = jsonDecode(response.body.toString());

      if(response.statusCode == 200){
        postsList.clear();

        for(Map i in body){
          postsList.add(DropDownModel.fromJson(i));
        }

        return postsList;

        // return body.map((e){
        //   final map = e as Map<String, dynamic> ;
        //   return DropDownModel(
        //     id: map['id'],
        //     title: map['title'],
        //     userId: map['userId'],
        //     body: map['body'],
        //   );
        // }).toList();
      }
      else{
        return postsList;
      }
    } on SocketException{
      throw Exception('no internet');
    }
  }

  var selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Api'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<DropDownModel>>(
                future: getPost(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return DropdownButton(
                        isExpanded: true,
                        value: selectedValue,
                        hint: Text('Select Value'),
                        items: snapshot.data!.map((e) {
                          return DropdownMenuItem(
                            value: e.id.toString(),
                            child: Text(e.id.toString()),
                          );
                        }).toList(),
                        onChanged: (value){
                          selectedValue = value;
                          setState(() {

                          });
                        }
                    );
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}
