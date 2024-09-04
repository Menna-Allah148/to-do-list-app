import 'package:e_commerce_app/cubit/register_cubit.dart';
import 'package:e_commerce_app/cubit/register_states.dart';
import 'package:e_commerce_app/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterCubit cubit = RegisterCubit();

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
      create: (context)=> cubit,
      child: BlocListener<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              DialogUtils.showLoading(
                  context: context, loadingLabel: 'Loading.....');
            } else if (state is RegisterErrorState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                  context: context,
                  contents: state.errorMessage,
                  posActionName: 'Ok',
                  title: "Error");
            } else if (state is RegisterSuccessState) {
              DialogUtils.showMessage(
                  context: context,
                  contents: 'Register Successfully!',
                  posActionName: 'Ok',
                  title: "Success");
            }
          },
          child: Scaffold(
            backgroundColor: Color(0xFF004182), // Same dark blue background color
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
                          'Create Your Account',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Please sign up with your details',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 24),
    
                        // Full Name
                        Text(
                          'Full Name',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: cubit.nameController,
                          style:
                              TextStyle(color: Colors.black), // Text color black
                          decoration: InputDecoration(
                            labelText: 'Enter your name',
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
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
    
                        // E-mail Address
                        Text(
                          'E-mail Address',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: cubit.emailController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Enter your email address',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
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
                        Text(
                          'Confirmation Password',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: cubit.confirmPasswordController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Enter your password again',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value != cubit.passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
    
                        // Mobile Number
                        Text(
                          'Mobile Number',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: cubit.phoneController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Enter your mobile number',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your mobile number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 35.0),
    
                        // Sign Up Button
                        ElevatedButton(
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                             
                                 
                                 cubit.register();

                            
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
                            'Sign up',
                            style: TextStyle(
                                color: Colors.blue[900]), 
                          ),
                        ),
                        SizedBox(height: 16),
    
                        TextButton(
                          onPressed: () {
                    Navigator.pushNamed(context, 'LoginScreen');
                                                           

                          },
                          child: Text(
                            'Already have an account? Sign in',
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
