import 'package:flutter/material.dart';
import 'package:flutter_practice_working_with_api/example_one.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screen_id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ScreenModel> screensList = [];

  String selectedValue='se';

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

      body: SafeArea(
          child: Center(
        child: DropdownButton(
          // value: selectedValue,
          hint: Text('Select the Screen'),
          items: screensList.map((e) {
            return DropdownMenuItem(
              value: e.id.toString(),
              child: Text(e.screenName.toString()),
            );
          }).toList(),
          onChanged: (value) {
            selectedValue != value;
            setState(() {

            });
          },
          // items: [
          //   DropdownMenuItem(
          //     value: screensList[],
          //       child: Text('data')
          //   )
          // ],
        ),
      )),
    );
  }
}

class ScreenModel {
  final int id;
  final String screenName;

  ScreenModel({required this.id, required this.screenName});
}
