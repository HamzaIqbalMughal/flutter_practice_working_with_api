import 'package:flutter/material.dart';
import 'package:flutter_practice_working_with_api/example_five_screen.dart';
import 'package:flutter_practice_working_with_api/example_four_screen.dart';
import 'package:flutter_practice_working_with_api/example_three_screen.dart';
import 'package:flutter_practice_working_with_api/example_two_screen.dart';
import 'package:flutter_practice_working_with_api/home_screen.dart';

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
      initialRoute: ExampleFiveScreen.screen_id,
      routes: {
        HomeScreen.screen_id: (context) => HomeScreen(),
        ExampleTwoScreen.screen_id: (context) => ExampleTwoScreen(),
        ExampleThreeScreen.screen_id: (context) => ExampleThreeScreen(),
        ExampleFourScreen.screen_id: (context) => ExampleFourScreen(),
        ExampleFiveScreen.screen_id: (context) => ExampleFiveScreen(),
      },
    );
  }
}
