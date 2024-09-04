import 'package:e_commerce_app/cubit/login_states.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitalState());

  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController(text: 'Ahmed23456@123');
  var emailController = TextEditingController(text: 'ahmedmutti@gmail.com');
  bool isObscure = true;

  void login() async {
   
    if (formKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState());

        var response = await ApiManager.login(
            emailController.text, passwordController.text);

        if (response.token == null) {

          emit(LoginErrorState(errorMessage: response.message!));

        } else {
          emit(LoginSuccessState(response: response));
    
        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    }
  }
}
