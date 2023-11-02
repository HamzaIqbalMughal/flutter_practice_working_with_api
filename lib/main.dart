import 'package:flutter/material.dart';
import 'package:flutter_practice_working_with_api/drop_down_api_screen.dart';
import 'package:flutter_practice_working_with_api/example_five_screen.dart';
import 'package:flutter_practice_working_with_api/example_four_screen.dart';
import 'package:flutter_practice_working_with_api/example_three_screen.dart';
import 'package:flutter_practice_working_with_api/example_two_screen.dart';
import 'package:flutter_practice_working_with_api/example_one.dart';
import 'package:flutter_practice_working_with_api/home_screen.dart';
import 'package:flutter_practice_working_with_api/signup_screen.dart';
import 'package:flutter_practice_working_with_api/upload_image_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // initialRoute : ExampleThreeScreen.screen_id,
      // initialRoute: ExampleFourScreen.screen_id,
      // initialRoute: ExampleFiveScreen.screen_id,
      // initialRoute: SignUpScreen.screen_id,
      // initialRoute: UploadImageScreen.screen_id,
      // initialRoute: DropDownAPIScreen.screen_id,

      initialRoute: HomeScreen.screen_id,
      routes: {
        HomeScreen.screen_id: (context) => HomeScreen(),
        ExampleOne.screen_id: (context) => ExampleOne(),
        ExampleTwoScreen.screen_id: (context) => ExampleTwoScreen(),
        ExampleThreeScreen.screen_id: (context) => ExampleThreeScreen(),
        ExampleFourScreen.screen_id: (context) => ExampleFourScreen(),
        ExampleFiveScreen.screen_id: (context) => ExampleFiveScreen(),
        SignUpScreen.screen_id: (context) => SignUpScreen(),
        UploadImageScreen.screen_id: (context) => UploadImageScreen(),
        DropDownAPIScreen.screen_id: (context) => DropDownAPIScreen(),
      },
    );
  }
}
