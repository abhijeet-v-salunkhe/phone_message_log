import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatefulWidget{
  const PermissionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PermissionScreenState();
  }
}

class _PermissionScreenState extends State<PermissionScreen>{


  void checkPermission() async{
    PermissionStatus statusPhone = await Permission.phone.status;
    PermissionStatus statusContacts = await Permission.contacts.status;

    if(statusPhone.isGranted && statusContacts.isGranted) {

    }
    
  }

  @override
  Widget build(BuildContext context) {
    return 
  }
}