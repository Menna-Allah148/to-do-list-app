import 'dart:convert';

import 'package:e_commerce_app/cubit/register_states.dart';
import 'package:e_commerce_app/data/end_points.dart';
import 'package:e_commerce_app/data/model/Response/login_response.dart';
import 'package:e_commerce_app/data/model/Response/register_response.dart';
import 'package:http/http.dart' as http;

// https://ecommerce.routemisr.com/api/v1/auth/signup

class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';

  static Future<RegisterResponse> register(String email, String name,
      String phone, String password, String rePassword) async {
    Uri url = Uri.https(baseUrl, EndPoint.signUp);
    try {
      var response = await http.post(url, body: {
        "name": "mennaallah",
        "email": "menna1234@gmail.com",
        "password": "1234567890",
        "rePassword": "1234567890",
        "phone": "01102579355"
      });
      var bodyString = response.body; //string
      var json = jsonDecode(bodyString); //json
      return RegisterResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
//https://ecommerce.routemisr.com/api/v1/auth/signin

  static Future<LoginResponse> login(String email, String password) async {
    Uri url = Uri.https(baseUrl, EndPoint.login);
    try {
      var response = await http.post(url, body: {
      {
     "email":"ahmedmutti@gmail.com",
     "password":"Ahmed@123902"
}
      });
      var bodyString = response.body; //string
      var json = jsonDecode(bodyString); //json
      return LoginResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
