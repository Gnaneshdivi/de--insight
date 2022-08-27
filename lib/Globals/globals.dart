import 'package:cryptosplit/Models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Globals {
  const Globals._();

  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static User user = User(
      uniqueId: '',
      email: '',
      password: '',
      device1: '',
      device2: '',
      sharePerm: false,
      uploadPerm: false,
      accessLevel: 2);
}
