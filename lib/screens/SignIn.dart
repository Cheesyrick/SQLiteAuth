import 'package:flutter/material.dart';
import '../database/user_command.dart';
import '../screens/SignUp.dart';
import '../screens/Welcome.dart';

import '../module/User.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController usernamefield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  final formState = GlobalKey<FormState>();
  late UserCommand dbUser = UserCommand();
  final passwordFocus = FocusNode();
  var _isObsecured;

  @override
  void initState() {
    super.initState();
    _isObsecured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 25, bottom: 25),
                child: const Text(
                  "Menu Sign In",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              Form(
                key: formState,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 25),
                      child: TextFormField(
                        enabled: true,
                        controller: usernamefield,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          hintText: "Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 25),
                      child: TextFormField(
                        enabled: true,
                        controller: passwordfield,
                        obscureText: _isObsecured,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          hintText: "Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    TextButton(
                        onPressed: () async {
                          if (formState.currentState!.validate()) {
                            User? user = await dbUser.signIn(
                                usernamefield.text, passwordfield.text);
                            if (user != null) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Welcome()));
                            } else {
                              Widget okButton = TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'));
                              AlertDialog alert = AlertDialog(
                                title: const Text("Error"),
                                content:
                                    const Text("Username atau Password Salah"),
                                actions: [okButton],
                              );
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  });
                            }
                          }
                        },
                        child: const Text('Login')),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const Signup();
                          }));
                        },
                        child: const Text("Sign Up"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
