// @dart=2.9
import 'package:cryptosplit/Globals/globals.dart';
import 'package:cryptosplit/Screens/splashscreen.dart/splashscreen.dart';
import 'package:cryptosplit/utils/route_generator.dart';
import 'package:flutter/material.dart';

import 'Screens/Authentation/auth.dart';

Future<void> main() async {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WE3',
      scaffoldMessengerKey: Globals.scaffoldMessengerKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: SplashScreen.id,
    );
  }
}
