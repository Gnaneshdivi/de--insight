import 'package:cryptosplit/Screens/Home_Screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewStat extends StatefulWidget {
  static const id = 'ViewStat';
  const ViewStat({Key? key}) : super(key: key);

  @override
  State<ViewStat> createState() => _ViewStatState();
}

class _ViewStatState extends State<ViewStat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
    );
  }
}
