import 'package:e_commerce_app/cubit/login_cubit.dart';
import 'package:e_commerce_app/cubit/login_states.dart';
import 'package:e_commerce_app/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit cubit = LoginCubit();

  // var formKey = GlobalKey<FormState>();
  // var nameController = TextEditingController(text: 'menna');
  // var emailController = TextEditingController(text: 'menna@gmail.com');
  // var passwordController = TextEditingController(text: '123456');
  // var confirmPasswordController = TextEditingController(text: '123456');
  // var phoneController = TextEditingController(text: '01102578355');
  // bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              DialogUtils.showLoading(
                  context: context, loadingLabel: 'Loading.....');
            } else if (state is LoginErrorState) {
             
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                  context: context,
                  contents: "Invalid email or password",
                  posActionName: 'Ok',
                  title: "Error");
            } else if (state is LoginSuccessState) {
              DialogUtils.showMessage(
                  context: context,
                  contents: 'login Successfully!',
                  posActionName: 'Ok',
                  title: "Success");
            }
          },
          child: Scaffold(
            backgroundColor:
                Color(0xFF004182), // Same dark blue background color
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Logo Image
                        Image.asset(
                          'lib/images/route_logo.png',
                          height: 100,
                          width: 500,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Welcome back to Route',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Please sign in with your mail',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 24),

                        // Full Name
                        Text(
                          'Email Address',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: cubit.emailController,
                          style: TextStyle(
                              color: Colors.black), // Text color black
                          decoration: InputDecoration(
                            labelText: 'enter your email address',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            filled: true,
                            fillColor: Colors.white, // White fill color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),

                        // E-mail Address

                        SizedBox(height: 16.0),

                        // Password
                        Text(
                          'Password',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: cubit.passwordController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Enter your password',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey[800],
                              ),
                              onPressed: () {
                                setState(() {
                                  cubit.isObscure = !cubit.isObscure;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: cubit.isObscure,
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),

                        // Confirmation Password

                        SizedBox(height: 10),

                        SizedBox(height: 35.0),

                        // Login Button
                        ElevatedButton(
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // White button color
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.blue[900]),
                          ),
                        ),
                        SizedBox(height: 16),

                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'RegisterScreen');
                          },
                          child: Text(
                            "Don't have an account? Create Account",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
