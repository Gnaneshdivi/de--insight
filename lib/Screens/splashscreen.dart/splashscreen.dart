import 'package:cryptosplit/Screens/Authentation/auth.dart';
import 'package:cryptosplit/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    (() async {
      Future.delayed(Duration(seconds: 10));
      if (!mounted) return;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        // add your code here.

        Navigator.pushReplacementNamed(
          context,
          AuthenticationScreen.id,
        );
      });
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(40, 36, 60, 1),
          body: Center(
            child: Image.asset(
              'assets/kadi.png',
              height: screenWidth(context) * 0.5,
              width: screenWidth(context) * 0.7,
            ),
          )),
    );
  }
}
