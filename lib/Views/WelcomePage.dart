import 'package:flutter/material.dart';
import 'package:login6868/Views/LoginPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,   //set full
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_mobile.jpg'), fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 150 , 0, 0),
                      child: Text("S-Booking",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 44,
                      color: Colors.black87,
                    ),),
                    ),
                    Text("Book là thích - kick là mê",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              LoginPage()
            ],
          ),
        )
      ),
    );
  }
}
