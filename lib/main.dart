import 'package:flutter/material.dart';
import 'package:otenki/config/config.dart';
import 'package:otenki/view/input_page.dart';
import 'package:otenki/view/result_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clima",
      theme: ThemeData(
        appBarTheme: kAppBarTheme,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          border: kTextFieldStyle,
          focusedBorder: kTextFieldStyle,
          enabledBorder: kTextFieldStyle
        )
      ),
      routes: {
        "/": (context) => InputPage(),
        "/result": ((context) => ResultPage())
      },

    );
  }
}