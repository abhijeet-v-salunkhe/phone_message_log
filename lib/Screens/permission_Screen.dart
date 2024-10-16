import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_logs_and_messages/Screens/my_home_page.dart';
import 'package:phone_logs_and_messages/helper.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PermissionScreenState();
  }
}

class _PermissionScreenState extends State<PermissionScreen> {
  late Widget content = const Center(
    child: CircularProgressIndicator(),
  );

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  void checkPermission() async {
    PermissionStatus statusPhone = await Permission.phone.status;
    PermissionStatus statusContacts = await Permission.contacts.status;

    // If both permissions are granted, open the app
    if (statusPhone.isGranted && statusContacts.isGranted) {
      _openTabsScreen();
    } else {
      // If permissions are permanently denied, go to settings
      if (statusContacts.isPermanentlyDenied || statusPhone.isPermanentlyDenied) {
        await openAppSettings();
        // if (statusContacts.isPermanentlyDenied || statusPhone.isPermanentlyDenied) {
        //   _closeApp();
        // } else {
        //   checkPermission();
        // }
        _closeApp();
        
      } else {
        // Otherwise, request permissions
        _getCallsPermissions();
      }
    }
  }

  void _getCallsPermissions() async {
    PermissionStatus statusPhone = await Permission.phone.request();
    PermissionStatus statusContacts = await Permission.contacts.request();

    if (statusPhone.isGranted && statusContacts.isGranted) {
      _openTabsScreen();
    } else if (statusPhone.isPermanentlyDenied || statusContacts.isPermanentlyDenied) {
      await openAppSettings();
      // if (statusContacts.isPermanentlyDenied || statusPhone.isPermanentlyDenied) {
      //   _closeApp();
      // } else {
      //     checkPermission();
      //   }
      _closeApp();
    } else {
      // Show the permission dialog box if permissions are not granted
      setState(() {
        content = permissionDialogBox(
          allowFunction: _getCallsPermissions,
          closeAppFunction: _closeApp,
        );
      });
    }
  }

  void _openTabsScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const MyHomePage(),
    ));
  }

  void _closeApp() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: content);
  }
}
