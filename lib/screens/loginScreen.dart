// ignore_for_file: unnecessary_const, file_names

import 'package:abc/main.dart';
import 'package:abc/screens/homeScreen.dart';
import 'package:abc/screens/registerScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //login validation
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //emailfield
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.email,
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: '@gmai.com',
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ('Email Required ');
        }
        //rexexp for
        if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
          return ('please enter a valid email');
        }
        return null;
      },

      onSaved: (value) {
        emailController.text = value!;
      },

      textInputAction: TextInputAction.next,
    );

    //password

    final passwordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordController,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.vpn_key,
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        /* hintText: 'secret password', */
        labelText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      /* keyboardType: TextInputType.emailAddress, */
      //validator
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ('Password Required');
        }
        if (!regex.hasMatch(value)) {
          return ("InValid Password (req: min 6 charecters)");
        }
      },

      onSaved: (value) {
        passwordController.text = value!;
      },

      textInputAction: TextInputAction.done,
    );
    final button = ElevatedButton(
      child: const Text("Login"),
      onPressed: () {
        /* print("login pressed"); */
        signIn(emailController.text, passwordController.text);
      },
    );
    return Scaffold(
      /*  bottomNavigationBar: Container(
        height: 60,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login Failed !!  ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                helpDesk(context);
              },
              child: const Text(
                "HELP ?",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ), */
      /* appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Check Point', style: TextStyle(color: Colors.blue)),
      ), */
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage('assets/lg.png'),
                ),
              ),
              width: 250,
              height: 250,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                      bottomRight: Radius.elliptical(10, 10),
                      topLeft: Radius.elliptical(10, 10),
                      bottomLeft: Radius.elliptical(10, 10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 30,
                      blurRadius: 100,
                    )
                  ]),
              margin: const EdgeInsets.only(left: 0, right: 10),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                      /* shrinkWrap: true, */
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '  LogIn',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 20),
                        ),
                        Container(
                          color: Colors.white,
                          height: 200,
                          child: const Image(
                            //fit: BoxFit.cover,
                            image: AssetImage('assets/log.png'),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        emailField,
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        passwordField,
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        button,
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account ?"),
                            GestureDetector(
                              onTap: () {
                                //print("rqst for reg");
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (contex) =>
                                        const RegistrationScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "  SignUp",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        Center(
                            child: GestureDetector(
                                onTap: () {
                                  helpDesk(context);
                                },
                                child: Text("Help ?",
                                    style: TextStyle(color: Colors.blue)))),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  //login fn

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SaveLogin, true);
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(
                    msg: "Login successful", textColor: Colors.red),
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (contex) => const HomeScreen(),
                  ),
                ),
              });
      /* .catchError((e) {
        Fluttertoast.showToast(msg: e!.message, textColor: Colors.red);
      }); */
    }
  }

  void helpDesk(BuildContext context) async {
    showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text("HelpDesk"),
            content: Expanded(
              /*    */
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Check these ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Text(" 1 : You have to SignUp befor login"),
                    Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                    Text(" 2 : You need a proper Internet connection"),
                    Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                    Text(" 3 : You have to enter email in proper format"),
                    Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                    Text(" 4 : Avoid spelling mistake"),
                    Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                    Text(" 5 : Now Exit the app and run again"),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
