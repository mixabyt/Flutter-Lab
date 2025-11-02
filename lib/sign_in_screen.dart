import 'package:flutter/material.dart';
import 'sign_up_screen.dart';
import 'reset_password_screen.dart';
class SignInScreen extends StatefulWidget {

  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController nameController1 = TextEditingController();

  bool nameControllerEmpty = false;
  bool nameController1Empty = false;

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
              Center(child: Image.network('https://i.guim.co.uk/img/media/327aa3f0c3b8e40ab03b4ae80319064e401c6fbc/377_133_3542_2834/master/3542.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=34d32522f47e4a67286f9894fc81c863', height: 100, )),
              Center(child: Text("Sign In", 
              style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 32),
                    )
                  ),
              SizedBox(height: 20),
              Text(
                'Email',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                ),
             TextField(
              controller: nameController,
            ),
            nameControllerEmpty ? Text("email field can not be empty", style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.red),) : Container(),
              SizedBox(height: 10),
             Text(
                  'Password',
                  style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                ),
              TextField(
              controller: nameController1,
              obscureText: true,
            ),
            nameController1Empty ? Text("password field can not be empty", style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.red),) : Container(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                  });
                  nameControllerEmpty = false;
                  nameController1Empty = false;
                  nameController.clear();
                  nameController1.clear();
                    
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                style: ElevatedButton.styleFrom( 
                  backgroundColor: Colors.white,
                ),
                child: Text('Sign Up', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.blue) ,)
              ),
            ),
            SizedBox(height: 10),
             Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                    setState(() {
                    });
                    if (nameController.text.isEmpty || nameController1.text.isEmpty) {
                      if (nameController.text.isEmpty && nameController1.text.isEmpty) {
                        nameControllerEmpty = true;
                        nameController1Empty = true;
                      } else if (nameController.text.isEmpty) {
                        nameControllerEmpty = true;
                        nameController1Empty = false;
                      } else if (nameController1.text.isEmpty) {
                        nameController1Empty = true;
                        nameControllerEmpty = false;
                      }
                       
                      return;
                    }
                      AlertDialog alert = AlertDialog(
                        title: Text("Login"),
                        content: Text("Login Successful"),
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                      nameControllerEmpty = false;
                      nameController1Empty = false;
                      nameController.clear();
                      nameController1.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 42, 57, 145),
                    ),
                    child: Text(
                      'Login',
                       style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child:  Text(
                      'Reset password',
                      style: Theme.of( context).textTheme.labelMedium!.copyWith(color: Colors.blue)
                    ),
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}