import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remind_launcher/bloc/index.dart';

enum NoticeType { REMINDER, NOTE, PROJECT }

class LauncherHome extends StatefulWidget {
  @override
  _LauncherHomeState createState() => _LauncherHomeState();
}

class _LauncherHomeState extends State<LauncherHome> {
  String _time = DateFormat('kk:mm').format(DateTime.now());
  String _date = DateFormat.MMMMEEEEd().format(DateTime.now());

  // bloc
  MainBloc _bloc;
  bool _isInitialised = false;

  Widget _buildNavItem(String image, String title, {Function onPressed}) {
    return InkWell(
      child: Container(
        width: 50.0,
        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ),
      ),
      onTap: onPressed,
    );
  }

  Widget _buildRemindItem(NoticeType type, String title, String body) {
    return Stack(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 35.0,
              child: type == NoticeType.NOTE
                  ? Image.asset('assets/images/note.png')
                  : type == NoticeType.PROJECT
                      ? Image.asset('assets/images/project.png')
                      : Image.asset('assets/images/reminder.png'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    body,
                    style: TextStyle(
                      color: Color(0xFF5C1616),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 50.0,
            )
          ],
        ),
        Positioned(
          right: 0.0,
          child: Container(
            child: InkWell(
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    // Get installed apps
    Timer.periodic(
      Duration(seconds: 1),
      (Timer t) => setState(
        () {
          DateTime now = DateTime.now();
          _time = DateFormat('kk:mm').format(now);
          _date = DateFormat.MMMMEEEEd().format(DateTime.now());
        },
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialised) {
      setState(() {
        _bloc = Provider.of<MainBloc>(context);
      });
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/car_ultra_urban.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.3),
          ),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _time,
                        style: TextStyle(color: Colors.white, fontSize: 50.0),
                      ),
                      Text(
                        _date,
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        borderRadius: BorderRadius.circular(30.0)),
                    width: MediaQuery.of(context).size.width - 20.0,
                    height: MediaQuery.of(context).size.height - 160,
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 30,
                      bottom: 100.0,
                    ),
                    // TODO: Change to listview.builder
                    child: ListView(
                      children: <Widget>[
                        _buildRemindItem(NoticeType.NOTE, 'DINNER',
                            '2 wraps of Amala, Egusi soup'),
                        // hr
                        Divider(
                          color: Color.fromRGBO(114, 96, 96, 0.76),
                          indent: 30.0,
                          thickness: 2.0,
                          height: 40.0,
                        ),
                        _buildRemindItem(NoticeType.REMINDER, 'REMINDER',
                            'Finish writing Personal statement'),

                        Divider(
                          color: Color.fromRGBO(114, 96, 96, 0.76),
                          indent: 30.0,
                          thickness: 2.0,
                          height: 40.0,
                        ),

                        _buildRemindItem(NoticeType.PROJECT, 'PROJECT',
                            'Build Personal Portfolio Website'),

                        Divider(
                          color: Color.fromRGBO(114, 96, 96, 0.76),
                          indent: 30.0,
                          thickness: 2.0,
                          height: 40.0,
                        ),

                        _buildRemindItem(NoticeType.NOTE, 'DINNER',
                            '2 wraps of Amala, Egusi soup'),
                        // hr
                        Divider(
                          color: Color.fromRGBO(114, 96, 96, 0.76),
                          indent: 30.0,
                          thickness: 2.0,
                          height: 40.0,
                        ),
                        _buildRemindItem(NoticeType.REMINDER, 'REMINDER',
                            'Finish writing Personal statement'),

                        Divider(
                          color: Color.fromRGBO(114, 96, 96, 0.76),
                          indent: 30.0,
                          thickness: 2.0,
                          height: 40.0,
                        ),

                        _buildRemindItem(NoticeType.PROJECT, 'PROJECT',
                            'Build Personal Portfolio Website'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.37),
                        borderRadius: BorderRadius.circular(30.0)),
                    width: MediaQuery.of(context).size.width - 20.0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 17.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildNavItem(
                          'assets/images/phone.png',
                          "Phone",
                          onPressed: () {
                            _bloc.launchDialer();
                          },
                        ),
                        _buildNavItem(
                          'assets/images/message.png',
                          "Messages",
                          onPressed: () {
                            _bloc.launchMessaging();
                          },
                        ),
                        _buildNavItem('assets/images/drawer.png', "Drawer"),
                        _buildNavItem(
                          'assets/images/chrome.png',
                          "Browser",
                          onPressed: () {
                            _bloc.launchChrome();
                          },
                        ),
                        _buildNavItem(
                          'assets/images/camera.png',
                          "Camera",
                          onPressed: () {
                            _bloc.launchCamera();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
