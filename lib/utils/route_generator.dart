import 'package:cryptosplit/utils/helpers.dart';
import 'package:flutter/material.dart';

import '../Screens/Authentation/auth.dart';
import '../Screens/Home_Screen/homescreen.dart';
import '../Screens/splashscreen.dart/splashscreen.dart';

class RouteGenerator {
  static const _id = 'RouteGenerator';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;
    log(_id, msg: "Pushed ${settings.name}(${args ?? ''})");
    switch (settings.name) {
      case HomeScreen.id:
        return _route(HomeScreen());
      case AuthenticationScreen.id:
        return _route(AuthenticationScreen());
      case SplashScreen.id:
        return _route(SplashScreen());

      // case VerifyPhoneNumberScreen.id:
      //   return _route(VerifyPhoneNumberScreen(
      //     phoneNumber: args,
      //   ));
      default:
        return _errorRoute(settings.name);
    }
  }

  static MaterialPageRoute _route(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);

  static Route<dynamic> _errorRoute(String? name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('ROUTE \n\n$name\n\nNOT FOUND'),
        ),
      ),
    );
  }
}
