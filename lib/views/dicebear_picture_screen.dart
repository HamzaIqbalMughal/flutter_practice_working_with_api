import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  String _errorText = '';

  String seedValue = '';

  late bool initialState;

  Future<String> getImageFromDiceBear() async {
    final response = await http.get(Uri.parse(
        'https://api.dicebear.com/7.x/adventurer/svg?seed=${seedValue}'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load SVG from the API');
    }
  }

  @override
  void initState() {
    initialState = true;
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
                child: initialState
                    ? Center(
                        child: Text('Image from DiceBear'),
                      )
                    : FutureBuilder<String>(
                        future: getImageFromDiceBear(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // return Center(child: CircularProgressIndicator());
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error : ${snapshot.error}');
                          } else {
                            return SvgPicture.string(
                              snapshot.data.toString(),
                            );
                          }
                        },
                      ),
              ),
              SizedBox(
                height: 100,
              ),
              TextField(
                controller: _nameControlller,
                decoration: InputDecoration(
                  label: Text('Enter any Name'),
                ),
              ),
              // TextFormField(
              //   controller: _nameControlller,
              //   decoration: InputDecoration(
              //     label: Text('Enter any Name'),
              //     // errorText: _errorText,
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (_nameControlller.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Please Enter Name...");
                  } else {
                    seedValue = _nameControlller.text.toString();
                    setState(() {
                      initialState = false;
                    });
                  }
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: Text('Generate Pic')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
