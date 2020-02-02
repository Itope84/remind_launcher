import 'package:flutter/material.dart';
import 'package:remind_launcher/screens/home.dart';
import 'package:remind_launcher/theme/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remind Launcher',
      theme: appTheme,
      home: LauncherHome(),
    );
  }
}
