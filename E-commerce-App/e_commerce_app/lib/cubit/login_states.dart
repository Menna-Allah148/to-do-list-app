import 'package:e_commerce_app/data/model/Response/login_response.dart';

abstract class LoginStates {}

class LoginInitalState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginResponse response;
  LoginSuccessState({required this.response});
}

class LoginErrorState extends LoginStates {
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}
