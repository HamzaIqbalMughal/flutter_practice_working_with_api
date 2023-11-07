import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/products_model.dart';

class ExampleFiveScreen extends StatefulWidget {
  const ExampleFiveScreen({super.key});

  static const screen_id = 'ExampleFiveScreen';

  @override
  State<ExampleFiveScreen> createState() => _ExampleFiveScreenState();
}

class _ExampleFiveScreenState extends State<ExampleFiveScreen> {
  Future<ProductsModel> getProductsApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/d7874370-ee1f-40c3-a9b4-2cc962b6a809'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
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
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<ProductsModel>(
            future: getProductsApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(snapshot.data!.data![index].shop!.name
                              .toString()),
                          subtitle: Text(snapshot
                              .data!.data![index].shop!.shopemail
                              .toString()),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot
                                .data!.data![index].shop!.image
                                .toString()),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                snapshot.data!.data![index].images!.length,
                            itemBuilder: (context, innerindex) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, top: 10),
                                child: Container(
                                  // height: MediaQuery.of(context).size.height * 0.25,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue.shade100,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data!.data![index]
                                            .images![innerindex].url
                                            .toString(),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Icon(snapshot.data!.data![index].inWishlist == false
                            ? Icons.favorite
                            : Icons.favorite_outline),
                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: LinearProgressIndicator(),
                  ),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
