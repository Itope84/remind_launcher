import 'package:flutter/material.dart';

enum NoticeType { REMINDER, NOTE, PROJECT }

class LauncherHome extends StatefulWidget {
  @override
  _LauncherHomeState createState() => _LauncherHomeState();
}

class _LauncherHomeState extends State<LauncherHome> {
  Widget _buildNavItem(String image, String title) {
    return InkWell(
      child: Container(
        width: 50.0,
        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildRemindItem(NoticeType type, String title, String body) {}

  @override
  Widget build(BuildContext context) {
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
                        "02:35",
                        style: TextStyle(color: Colors.white, fontSize: 50.0),
                      ),
                      Text(
                        "Friday, December 03",
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    // TODO: Change to listview.builder
                    child: ListView(
                      children: <Widget>[],
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
                        _buildNavItem('assets/images/phone.png', "Phone"),
                        _buildNavItem('assets/images/message.png', "Messages"),
                        _buildNavItem('assets/images/drawer.png', "Drawer"),
                        _buildNavItem('assets/images/chrome.png', "Browser"),
                        _buildNavItem('assets/images/camera.png', "Camera"),
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
