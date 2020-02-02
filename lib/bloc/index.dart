import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class MainBloc with ChangeNotifier {
  List _apps = [];

  Future<void> launchChrome() async {
    bool isChromeInstalled =
        await DeviceApps.isAppInstalled('com.android.chrome');
    if (isChromeInstalled) {
      await DeviceApps.openApp('com.android.chrome');
    }
  }

  getHomeApps() {
    List apps = [];
    ApplicationWithIcon chrome =
        _apps.firstWhere((app) => app.packageName == 'com.android.chrome');
    ApplicationWithIcon messaging = _apps.firstWhere(
        (app) => app.packageName == "com.google.android.apps.messaging");

    ApplicationWithIcon phone =
        _apps.firstWhere((app) => app.packageName == "com.android.dialer");

    ApplicationWithIcon camera2 =
        _apps.firstWhere((app) => app.packageName == "com.android.camera2");

    apps.add(phone);

    if (messaging != null) {
      apps.add(messaging);
    }

    if (chrome != null) {
      apps.add(chrome);
    }

    apps.add(camera2);

    return apps;
  }

  Future<void> getApps() async {
    List apps = await DeviceApps.getInstalledApplications(
      onlyAppsWithLaunchIntent: true,
      includeAppIcons: true,
      includeSystemApps: true,
    );

    _apps = apps;

    this.notifyListeners();
  }
}
