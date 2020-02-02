import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class MainBloc with ChangeNotifier {
  List _apps = [];

  List get apps {
    return _apps;
  }

  // IDEA: If launch fails show an error
  Future<bool> launchChrome() async {
    bool chromeLaunched = await DeviceApps.openApp('com.android.chrome');
    return chromeLaunched;
  }

  Future<bool> launchCamera() async {
    return await DeviceApps.openApp('com.android.camera2');
  }

  Future<bool> launchMessaging() async {
    return await DeviceApps.openApp('com.google.android.apps.messaging');
  }

  Future<bool> launchDialer() async {
    return await DeviceApps.openApp('com.android.dialer');
  }

  Future<void> getApps({bool shouldNotify: true}) async {
    List apps = await DeviceApps.getInstalledApplications(
      onlyAppsWithLaunchIntent: true,
      includeAppIcons: true,
      includeSystemApps: true,
    );

    _apps = apps;

    if (shouldNotify) this.notifyListeners();
  }
}
