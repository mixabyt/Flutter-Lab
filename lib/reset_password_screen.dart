import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_lab_6/RemoteService.dart';
class ResetPasswordScreen extends StatefulWidget {
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

@override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<Response<dynamic>> resetPassword(String email) async {
    var dio = Dio();
    final response = await dio.post(
      RemoteService.resetPasswordUrl,
      data: {'email': email},
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
                    "Reset password",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 32),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "email field can not be empty";
                    }else if (!EmailValidator.validate(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        try {
                          final responce = await resetPassword(
                            nameController.text.trim(),
                          );
                          String message;
                          if (responce.statusCode == 200) {
                            message = "Password reset link sent to your email";
                          } else {
                            message = "Failed to send reset link";
                          }

                          AlertDialog alert = AlertDialog(
                          title: const Text("Reset Password"),
                          content: Text(
                            message),
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                        nameController.clear();
                        } catch (e) {
                          AlertDialog alert = AlertDialog(
                            title: const Text("Reset Password"),
                            content: const Text(
                                "Network error occurred"),
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }
                        
                        
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'Reset password',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
