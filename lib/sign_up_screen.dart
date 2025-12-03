import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_lab_6/RemoteService.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final nameController1 = TextEditingController();
  final nameController2 = TextEditingController();

  @override
  void initState() {
    nameController.clear();
    nameController1.clear();  
    nameController2.clear();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    nameController1.dispose();
    nameController2.dispose();
    super.dispose();
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    nameController.clear();
  }

  Future<Response<dynamic>> signUpUser(String name, String email, String password) async {
    var dio = Dio();
    final response = await dio.post(
      RemoteService.registerUrl,
      data: {'name': name, 'email': email, 'password': password},
    );
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 32),
                  ),
                ),
                SizedBox(height: 20),
                Text('Name', style: Theme.of(context).textTheme.labelSmall),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name field cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text('Email', style: Theme.of(context).textTheme.labelSmall),
                TextFormField(
                  controller: nameController1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email field cannot be empty';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text('Password', style: Theme.of(context).textTheme.labelSmall),
                TextFormField(
                  controller: nameController2,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password field cannot be empty';
                    } else if (value.length < 7) {
                      return 'Password must be at least 7 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        try {
                          final response = await signUpUser(
                            nameController.text.trim(),
                            nameController1.text.trim(),
                            nameController2.text.trim(),
                          );

                          String message;
                          if (response.statusCode == 200) {
                            message = "Sign Up Successful";
                          } else {
                            message = "Sign Up Failed";
                          }

                          AlertDialog alert = AlertDialog(
                          title: const Text("Sign Up"),
                          content: Text(message),
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                        _resetForm();
                          
                        } catch (e) {
                          AlertDialog alert = AlertDialog(
                            title: const Text("Sign Up"),
                            content: const Text(
                                "Network error occurred"),
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                          return;
                        }
                        
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _resetForm();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'Back',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
