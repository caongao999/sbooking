import 'dart:ui';

import 'package:flutter/material.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
       children: [
         Padding(
           padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
           child: Container(
             height: 300,
             width: 250,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(40)
             ),
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                   child: Text("Forgot password",
                   style: TextStyle(
                     fontSize: 30,
                     color: Colors.teal,
                     fontWeight: FontWeight.w800
                   )),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                   child: TextFormField(
                     decoration: InputDecoration(
                       icon: Icon(Icons.email),
                       labelText: "Email"
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                   child: ElevatedButton(onPressed: () {

                   }
                     ,
                     child: Text("Submit",
                       style: TextStyle(
                         fontSize: 25,
                       ),),
                     style: ElevatedButton.styleFrom(
                         onPrimary: Colors.white,
                         primary: Colors.black,
                         backgroundColor: Colors.cyan.withOpacity(0.5),
                         minimumSize: Size(double.infinity, 55),
                         shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                     ),
                   ),
                 ),
               ],
             ),
           ),
         )
       ],
        ),
      );
  }
}
