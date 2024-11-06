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
            margin: const EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 25),
            child: const Text("Anda Berhasil Login"),
          ),
          Container(
              padding: const EdgeInsets.only(top: 25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Signin()));
                },
                child: const Text("Log Out"),
              ))
        ],
      ),
    );
  }
}
