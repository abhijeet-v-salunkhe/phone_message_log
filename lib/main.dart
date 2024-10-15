import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter/rendering.dart';
import 'package:phone_logs_and_messages/Screens/my_home_page.dart';
//import 'package:riverpod/riverpod.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 209, 119, 198));
var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(0, 0, 0, 0));
void main() {
  //debugPrintMarkNeedsLayoutStacks = true;

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kDarkColorScheme.onPrimary,
            foregroundColor: kDarkColorScheme.onSurface),
        scaffoldBackgroundColor: kDarkColorScheme.surface,
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
            titleMedium: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
            bodyLarge: TextStyle(
              color: kDarkColorScheme.onSurface,
            ),
            bodyMedium: TextStyle(color: kDarkColorScheme.onSurface)),
      ),
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              titleMedium: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              bodyLarge: TextStyle(
                color: kColorScheme.onSurface,
              ),
              bodyMedium: TextStyle(
                color: kColorScheme.onSurface,
              ),
              bodySmall: TextStyle(
                color: kColorScheme.onSurface,
              ),
            ),
      ),
      home: const MyHomePage(),
    );
  }
}
