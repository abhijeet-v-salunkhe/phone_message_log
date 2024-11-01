import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:phone_logs_and_messages/Screens/contacts.dart";
//import "package:phone_logs_and_messages/Screens/d_keypad.dart";
import "package:phone_logs_and_messages/Screens/keypad.dart";
import "package:phone_logs_and_messages/Screens/messages.dart";
import "package:phone_logs_and_messages/Screens/recent_calls.dart";
import "package:phone_logs_and_messages/provider/device_dimensions_provider.dart";
//import 'package:url_launcher/url_launcher.dart';
//import 'package:phone_logs_and_messages/provider/device_dimensions_provider.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetList = [
    KeyPad(),
    RecentCalls(),
    Contacts(),
    Messages()
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) { // addPostFrameCallback is executed after the build method is completed or screen is ready with UI
      final size = MediaQuery.of(context).size;
      ref.read(deviceDimensionsProvider.notifier).state = size;
    } );
  }
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    //ref.read(deviceDimensionsProvider.notifier).state = size;

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
