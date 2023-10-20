import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<PhotoModel> photosList = [];

  Future<List<PhotoModel>> getPhotos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      photosList.clear();
      for (Map i in data) {
        PhotoModel photo = PhotoModel(title: i['title'], url: i['url'], id: i['id'],);
        photosList.add(photo);
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text('Example 2',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotos(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                        ),
                        title: Text(snapshot.data![index].id.toString()),
                        subtitle: Text(snapshot.data![index].title.toString()),
                      );
                    },
                  );
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      strokeAlign: 10,
                      strokeWidth: 10,
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

class PhotoModel {
  String title, url;
  int id;

  PhotoModel({required this.title, required this.url , required this.id});
}
