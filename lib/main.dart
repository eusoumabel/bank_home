import 'package:flutter/material.dart';
import 'package:flutter_challenge_3/pages/home_page.dart';
import 'package:flutter_challenge_3/utils/style/themes/base_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance',
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      home: HomePage(),
    );
  }
}
