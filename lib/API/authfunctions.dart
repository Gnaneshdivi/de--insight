import 'dart:convert';

import 'package:cryptosplit/Globals/urls.dart';
import 'package:cryptosplit/Models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Globals/apiurls.dart';

class Userlogin {
  Userlogin({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory Userlogin.fromJson(String str) => Userlogin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Userlogin.fromMap(Map<String, dynamic> json) => Userlogin(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };
}
