import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_launcher/bloc/index.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  // bloc
  MainBloc _bloc;
  bool _isInitialised = false;

  Widget _buildAppIcon(app) {
    return InkWell(
      onTap: () async {
        await DeviceApps.openApp(app.packageName);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50.0,
            child: Image.memory(
              app.icon,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            app.appName,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialised) {
      setState(() {
        _bloc = Provider.of<MainBloc>(context);
      });

      // Only rebuild if the apps haven't been fetched before
      bool rebuild = _bloc.apps.length < 1;

      _bloc.getApps(shouldNotify: rebuild);
      _isInitialised = true;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(),
        child: SafeArea(
          child: _bloc.apps.length > 0
              ? GridView.builder(
                  itemCount: _bloc.apps.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, int index) {
                    return _buildAppIcon(_bloc.apps[index]);
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
