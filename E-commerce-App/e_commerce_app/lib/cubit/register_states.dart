import 'package:e_commerce_app/data/model/Response/register_response.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  RegisterResponse response;
  RegisterSuccessState({required this.response});
}

class RegisterErrorState extends RegisterStates {
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}
