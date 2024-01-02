import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/ModelLogin.dart';


 Future<bool> authenticate(model) async {
try {
  final String url = "https://boarding-house.developer.vi-jp-te.info/api/v1/oauth/token";
final response = await http.post(
Uri.parse(url),
body: {
'email': model.email,
'password':model.password,
},
);

if (response.statusCode == 200) {
// Xác thực thành công
return true;
} else {
// Xác thực thất bại
Map<String, dynamic> error = json.decode(response.body);
throw Exception('Authentication failed: ${error['message']}');
}
} catch (e) {
// Xử lý lỗi nếu có
throw Exception('Failed to authenticate: $e');
}
}

