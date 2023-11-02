import 'package:flutter/material.dart';
import 'package:flutter_practice_working_with_api/drop_down_api_screen.dart';
import 'package:flutter_practice_working_with_api/example_five_screen.dart';
import 'package:flutter_practice_working_with_api/example_four_screen.dart';
import 'package:flutter_practice_working_with_api/example_one.dart';
import 'package:flutter_practice_working_with_api/example_three_screen.dart';
import 'package:flutter_practice_working_with_api/example_two_screen.dart';
import 'package:flutter_practice_working_with_api/signup_screen.dart';
import 'package:flutter_practice_working_with_api/upload_image_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screen_id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ScreenModel> screensList = [];

  // String selectedValue='se';
  var selectedValue;
  late String selectedRoute;

  void populateScreenList() {
    screensList.clear();
    screensList.add(ScreenModel(id: 1, screenName: 'Example 1'));
    screensList.add(ScreenModel(id: 2, screenName: 'Example 2'));
    screensList.add(ScreenModel(id: 3, screenName: 'Example 3'));
    screensList.add(ScreenModel(id: 4, screenName: 'Example 4'));
    screensList.add(ScreenModel(id: 5, screenName: 'Example 5'));
    screensList.add(ScreenModel(id: 6, screenName: 'DropDown Button with API'));
    screensList.add(ScreenModel(id: 7, screenName: 'SignUp Screen'));
    screensList.add(ScreenModel(id: 8, screenName: 'Upload Image Screen'));
  }

  @override
  Widget build(BuildContext context) {
    populateScreenList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('API Practice Work', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton(
                value: selectedValue,
                hint: Text('Select the Screen'),
                items: screensList.map((e) {
                  return DropdownMenuItem(
                    value: e.id.toString(),
                    child: Text(e.screenName.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedValue = value;
                  setState(() {});
                },
                // items: [
                //   DropdownMenuItem(
                //     value: screensList[],
                //       child: Text('data')
                //   )
                // ],
              ),
              InkWell(
                onTap: () {
                  if(selectedValue == null){
                    Fluttertoast.showToast(msg: 'Please select any screen.');
                  }
                  else{
                    switch (selectedValue) {
                      case '1':
                        selectedRoute = ExampleOne.screen_id;
                        break;
                      case '2':
                        selectedRoute = ExampleTwoScreen.screen_id;
                        break;
                      case '3':
                        selectedRoute = ExampleThreeScreen.screen_id;
                        break;
                      case '4':
                        selectedRoute = ExampleFourScreen.screen_id;
                        break;
                      case '5':
                        selectedRoute = ExampleFiveScreen.screen_id;
                        break;
                      case '6':
                        selectedRoute = DropDownAPIScreen.screen_id;
                        break;
                      case '7':
                        selectedRoute = SignUpScreen.screen_id;
                        break;
                      case '8':
                        selectedRoute = UploadImageScreen.screen_id;
                        break;
                    }
                    Navigator.pushNamed(context, selectedRoute);
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('Go to Selected Screen' , style: TextStyle(color: Colors.white),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenModel {
  final int id;
  final String screenName;

  ScreenModel({required this.id, required this.screenName});
}
