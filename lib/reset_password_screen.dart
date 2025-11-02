import 'package:flutter/material.dart';


class ResetPasswordScreen extends StatefulWidget {
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final nameController = TextEditingController();

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Reset password", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 32),)),
              SizedBox(height: 20),
               Text(
                  'Email',
                  style: Theme.of(context)
                    .textTheme
                    .labelSmall
                ),
             TextField(
              controller: nameController,
            ),
            show ? Text("email field can not be empty", style: TextStyle(color: Colors.red),) : Container(),
              SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                  if (nameController.text.isEmpty) {
                    show = true; 
                    return;
                  }
                  AlertDialog alert = AlertDialog(
                    title: Text("Reset Password"),
                    content: Text("Password reset link sent to your email"),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                  show = false;
                  nameController.clear();
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text('Reset password', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.blue),)
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Colors.white,
                ),
                child: Text('Back', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.blue),)
              ),
            ),
            SizedBox(height: 10),
             
            ],
          ),
        ),
      ),
    );
  }
}