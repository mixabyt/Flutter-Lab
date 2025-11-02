import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final nameController1 = TextEditingController();

  final nameController2 = TextEditingController();

  bool nameControllerEmpty = false;

  bool nameController1Empty = false;

  bool nameController2Empty = false;

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
              Center(child: Text("Sign Up", style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 32),
                    )
                  ),
              SizedBox(height: 20),
               Text(
                  'Name',
                  style: Theme.of(context)
                    .textTheme
                    .labelSmall 
                ),
             TextField(
              controller: nameController,
            ),
            nameControllerEmpty ? Text('Name field cannot be empty', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.red)) : Container(),

              SizedBox(height: 10),
               Text(
                  'Email',
                  style: Theme.of(context)
                    .textTheme
                    .labelSmall
                ),
             TextField(
              controller: nameController1,
            ),
            nameController1Empty ? Text('Email field cannot be empty', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.red)) : Container(),
              SizedBox(height: 10),
               Text(
                  'Password',
                  style: Theme.of(context)
                    .textTheme
                    .labelSmall
                ),
              TextField(
              controller: nameController2,
              obscureText: true,
            ),
            nameController2Empty ? Text('password cannot be empty', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.red)) : Container(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                    setState(() {});
                    print(nameControllerEmpty);
                  if (nameController.text.isEmpty || nameController1.text.isEmpty || nameController2.text.isEmpty) {
                    print(nameControllerEmpty);
                    if (nameController.text.isEmpty) {
                      nameControllerEmpty = true;
                    } else {
                      print("here");
                      nameControllerEmpty = false;
                    }
                    if (nameController1.text.isEmpty) {
                      nameController1Empty = true;
                    } else {
                      nameController1Empty = false;
                    }
                    if (nameController2.text.isEmpty) {
                      nameController2Empty = true;
                    } else {
                      nameController2Empty = false;
                    }
                    
                    return;
                  }

                  AlertDialog alert = AlertDialog(
                    title: Text("Sign Up"),
                    content: Text("Sign Up Successful"),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );

                  nameControllerEmpty = false;
                  nameController1Empty = false;
                  nameController2Empty = false;
                  nameController.clear();
                  nameController1.clear();
                  nameController2.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text('Sign Up', style: Theme.of( context).textTheme.labelMedium!.copyWith(color: Colors.blue),)
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
                child: Text('Back', style: Theme.of( context).textTheme.labelMedium!.copyWith(color: Colors.blue),)
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