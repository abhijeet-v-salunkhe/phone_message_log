import "package:flutter/material.dart";
import "package:phone_logs_and_messages/Screens/contacts.dart";
//import "package:phone_logs_and_messages/Screens/d_keypad.dart";
//import "package:phone_logs_and_messages/Screens/keypad.dart";
import "package:phone_logs_and_messages/Screens/messages.dart";
import "package:phone_logs_and_messages/Screens/recent_calls.dart";
//import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetList = [SizedBox(), RecentCalls(), Contacts(), Messages()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _widgetList.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //selectedItemColor: Colors.blue,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (value) {
          debugPrint("$value");
          
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dialpad,
            ),
            label: "Keypad",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
            ),
            label: "Recent",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
            ),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: "Messages",
          ),
        ],
      ),
    );
  }


  
}
