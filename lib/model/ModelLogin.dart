import 'package:flutter/material.dart';

class ModelLogin{
 final String email;
 final String password;
  ModelLogin({
  required this.email,
  required this.password,
  });


  factory ModelLogin.fromJson(Map<String, dynamic> json) {
   return ModelLogin(
       email: json['email'],
       password: json['password']
   );
  }
}