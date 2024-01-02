import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login6868/Views/WelcomePage.dart';

import 'App.dart';

class RegisterPage extends StatefulWidget {
   RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _register = GlobalKey<FormState> ();

  TextEditingController _email = TextEditingController();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();

  String? _validEmail(value) {
    if(value!.isEmpty) {
      return 'Mời nhập email';
    }
    RegExp validEmail = RegExp("^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)");
    if (!validEmail.hasMatch(value)) {
      return 'Lỗi định dạng email';
    }
    return null;
  }

  String? _validUser(value) {
    if (value!.isEmpty) {
      return 'Mời nhập tên user';
    }
    return null;
  }

  String? _validPass(value) {
    if(value!.isEmpty) {
      return 'Mời nhập mật khẩu';
    }
    if(value.length < 6) {
      return 'Mật khẩu quá yếu';
    }
    return null;
  }

  String? _validConfirmPass (value) {
    if(!_confirmPass.text.contains(_pass.text)) {
      return 'Mật khẩu không trùng khớp';
    }
    return null;
  }



  bool checkEmpty() {
    return _email.text.isNotEmpty && _pass.text.isNotEmpty && _confirmPass.text.isNotEmpty && _user.text.isNotEmpty;
  }
  void _registerBtn () {
    if(_register.currentState!.validate()) {
      Navigator.push(context as BuildContext,
          MaterialPageRoute(builder: (context) => GoHomePage(context),));
    }
  }


  static bool  passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/background_mobile.jpg",fit: BoxFit.contain,),
          Positioned.fill(
            child: Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child:Container(
                  height: double.infinity,
                  width: double.infinity,   //set full
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _register,
                        child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text("Register" ,
                                style:TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.teal
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextFormField(
                                validator: _validEmail,
                                controller: _email,
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextFormField(
                                validator: _validUser,
                                controller: _user,
                                decoration: InputDecoration(
                                    labelText: 'Username',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: TextFormField(
                                validator: _validPass,
                                controller: _pass,
                                obscureText: passwordVisible ? false : true,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  suffixIcon: IconButton(
                                    icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible =    !passwordVisible;
                                      });

                                    },
                                  )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: TextFormField(
                                validator: _validConfirmPass,
                                controller: _confirmPass,
                                obscureText: passwordVisible ? false : true,
                                decoration: InputDecoration(
                                    labelText: 'Confirm Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  suffixIcon: IconButton(
                                      icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                                      onPressed: () {
                                        setState(
                                              () {
                                            passwordVisible = !passwordVisible;},);}
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 230),
                              child: Text("",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.tealAccent,
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 7),
                              child: ElevatedButton(
                                onPressed:  _registerBtn,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Đã có tài khoản ?",
                                  style: TextStyle(
                                      fontSize: 20
                                  ),),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context,
                                        MaterialPageRoute(builder: (context) => WelcomePage(),));
                                  },
                                  child: Text("Login",
                                    style: TextStyle(
                                        color: Colors.tealAccent,
                                        fontSize: 24,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget GoHomePage(BuildContext context) {
  return HomePage();
}