import 'dart:async';

import 'package:abc/main.dart';
import 'package:abc/screens/homeScreen.dart';
import 'package:abc/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      checkUserLogin();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Welcome")),
    );
  }

  Future<void> checkUserLogin() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLogedIn = _sharedPrefs.getBool(SaveLogin);
    if (_userLogedIn == null || _userLogedIn == false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    }
  }
}
