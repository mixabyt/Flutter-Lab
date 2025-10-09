import 'package:flutter/material.dart';


class ResetPasswordScreen extends StatelessWidget {
  final nameController = TextEditingController();
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
              Center(child: Text("Reset password", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),)),
              SizedBox(height: 20),
              const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
             TextField(
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 247, 247, 247),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
              SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
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
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Text('Reset password', style: const TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),)
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Text('Back', style: const TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),)
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