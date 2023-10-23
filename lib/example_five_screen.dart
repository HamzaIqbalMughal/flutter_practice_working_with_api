import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/product_model.dart';

class ExampleFiveScreen extends StatefulWidget {
  const ExampleFiveScreen({super.key});

  static const screen_id = 'ExampleFiveScreen';

  @override
  State<ExampleFiveScreen> createState() => _ExampleFiveScreenState();
}

class _ExampleFiveScreenState extends State<ExampleFiveScreen> {

  Future<ProductModel> getProductsApi () async{
    
    final response = await http.get(Uri.parse('https://webhook.site/d7874370-ee1f-40c3-a9b4-2cc962b6a809'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return ProductModel.fromJson(data);
    }
    else{
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Example 5',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ProductModel>(
              future: getProductsApi(),
              builder: (context, snapshot){
                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Text(index.toString()),
                        ],
                      );
                    }
                );
              },
            )
          ),
        ],
      ),
    );
  }
}
