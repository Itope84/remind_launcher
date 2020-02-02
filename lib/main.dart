import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_launcher/bloc/index.dart';
import 'package:remind_launcher/screens/home.dart';
import 'package:remind_launcher/theme/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainBloc>(
      create: (context) => MainBloc(),
      child: MaterialApp(
        title: 'Remind Launcher',
        theme: appTheme,
        home: LauncherHome(),
      ),
    );
  }
}
