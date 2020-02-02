import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_launcher/bloc/index.dart';
import 'package:remind_launcher/screens/home.dart';
import 'package:remind_launcher/theme/style.dart';
import 'package:hardware_buttons/hardware_buttons.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<HomeButtonEvent> _homeButtonSubscription;

  @override
  void initState() {
    super.initState();

    _homeButtonSubscription = homeButtonEvents.listen((HomeButtonEvent event) {
      print(event);
      Navigator.of(context).popUntil((setting) => false);
    });
  }

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
