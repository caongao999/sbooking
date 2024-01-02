

import 'package:flutter/material.dart';
import 'package:login6868/Views/ForgotPassPage.dart';
import 'package:login6868/Views/App.dart';
import 'package:login6868/Views/RegisterPage.dart';

import '../apiCall/LoginApi.dart';
import '../model/ModelLogin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static bool passwordVisible=true;

  final GlobalKey<FormState> _submit = GlobalKey<FormState> (); //đặt khóa cho biểu mẫu formState

  //xử lí chuỗi vào
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  String? _validEmail(value) {
    if(value!.isEmpty) {
      return 'Mời nhập email';
    }
    // RegExp validEmail = RegExp("^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)");
    // if (!validEmail.hasMatch(value)) {
    //   return 'Lỗi định dạng email';
    // }
    return null;
  }

  String? _validPass(value) {
    if(value!.isEmpty) {
      return 'Mời nhập mật khẩu';
    }
    if(value.length <= 6) {
      return 'Mật khẩu không đúng';
    }
    return null;
  }

  bool checkEmpty() {
    return _email.text.isNotEmpty && _pass.text.isNotEmpty;
  }
  // Future<void> _submitBtn() async {
  //   if (_submit.currentState!.validate()) {
  //     // Lấy dữ liệu từ TextEditingController
  //     // Thông báo lỗi nếu email hoặc mật khẩu trống
  //     print('Email and password cannot be empty.');
  //
  //   } else {
  //     String email = _email.text;
  //     String password = _pass.text;
  //
  //     ModelLogin model = ModelLogin(email: email, password: password);
  //
  //     try {
  //       bool isAuthenticated = await authenticate(model);
  //
  //       if (isAuthenticated) {
  //         // Xử lý khi xác thực thành công
  //         Navigator.pushReplacement(
  //           context as BuildContext,
  //           MaterialPageRoute(builder: (context) => GoHomePage(context)),
  //         );
  //         print('Login successful!');
  //       } else {
  //         // Xử lý khi xác thực thất bại
  //         print('Login failed!');
  //       }
  //     } catch (e) {
  //       // Xử lý lỗi nếu có
  //       print('Error: $e');
  //     }
  //   }
  // }

  void _submitBtn() {
    if(_submit.currentState!.validate()) {
      Navigator.pushReplacement(
                    context as BuildContext,
                    MaterialPageRoute(builder: (context) => GoHomePage(context)),
                  );
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 450,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Colors.white.withOpacity(0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: SingleChildScrollView(
            child: Form(
              key: _submit,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text("Login" ,
                      style:TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Colors.teal                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
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
                            setState(
                                  () {
                                    passwordVisible = !passwordVisible;},);}
                    ),
                      ),
    ),
    ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgotPassPage(),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Text("Forgot password?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 7),
                    child: ElevatedButton(
                      onPressed:
                         _submitBtn,
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
                      Text("Chưa có tài khoản ?",
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RegisterPage(),));
                        },
                        child: Text("Register",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24
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
      );
  }
}
Widget GoHomePage(BuildContext context) {
  return HomePage();
}