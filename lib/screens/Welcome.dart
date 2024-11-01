import 'package:flutter/material.dart';
import 'SignIn.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 25),
            child: Text("Anda Berhasil Login"),
          ),
          Container(
              padding: EdgeInsets.only(top: 25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Signin()));
                },
                child: Text("Log Out"),
              ))
        ],
      ),
    );
  }
}
