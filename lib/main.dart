import 'package:app_watchink/screen/first_screen_mobile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.black
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black
        ) 
      ),
      home: const FirstScreenMobile(),
    );
  }
}
