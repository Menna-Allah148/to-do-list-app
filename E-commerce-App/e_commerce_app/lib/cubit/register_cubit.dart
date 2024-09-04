import 'package:e_commerce_app/cubit/register_states.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'menna');
  var emailController = TextEditingController(text: 'menna@gmail.com');
  var passwordController = TextEditingController(text: '123456');
  var confirmPasswordController = TextEditingController(text: '123456');
  var phoneController = TextEditingController(text: '01102578355');
  bool isObscure = true;
  void register() async {
    if (formKey.currentState?.validate()== true) {
      try {
        emit(RegisterLoadingState());

        var response = await ApiManager.register(
            emailController.text,
            nameController.text,
            passwordController.text,
            confirmPasswordController.text,
            phoneController.text);
        if (response.statusMsg == 'fail') {
          emit(RegisterErrorState(errorMessage: response.message!));
        } else {
          emit(RegisterSuccessState(response: response));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMessage: e.toString()));
      }
    }
  }
}
