import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors .black,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Create an Account'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Divider(),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen())
                ),
                child: Text('Sign In'),
            ),
          ]
        ),
      ),
    );
  }
}
