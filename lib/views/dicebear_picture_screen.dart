import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';

class DicebearPicScreen extends StatefulWidget {
  const DicebearPicScreen({super.key});

  static const String screen_id = 'DicebearPicScreen';

  @override
  State<DicebearPicScreen> createState() => _DicebearPicScreenState();
}

class _DicebearPicScreenState extends State<DicebearPicScreen> {

  TextEditingController _nameControlller = TextEditingController();

  Future<String> getImageFromDiceBear() async {
    final response = await http
        .get(Uri.parse('https://api.dicebear.com/7.x/initials/svg?seed=heelo'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load SVG from the API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image from Dicebear'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                ),
                child: FutureBuilder<String>(
                  future: getImageFromDiceBear(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }else if(snapshot.hasError){
                      return Text('Error : ${snapshot.error}');
                    }
                    else{
                      return SvgPicture.string(
                        snapshot.data.toString(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 100,),
              TextField(
                controller: _nameControlller,
                decoration: InputDecoration(
                  label: Text('Enter any word'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                  
                ),
                child: Center(child: Text('Generate Pic')),
              ),
            ],

          ),
        ),
      ),

      // body: Center(
      //   child: Container(
      //     height: 300,
      //     width: 300,
      //     decoration: BoxDecoration(
      //       color: Colors.green,
      //       // image: DecorationImage(
      //       //   fit: BoxFit.fill,
      //       //     // image: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',)
      //       //   image: NetworkImage('https://api.dicebear.com/7.x/initials/svg?seed=heelo'),
      //       // ),
      //     ),
      //     child: SvgPicture.asset(
      //         'https://api.dicebear.com/7.x/initials/svg?seed=heelo'),
      //   ),
      // ),
    );
  }
}
