// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:abc/homeProps/ser.dart';
import 'package:abc/model/profile.dart';
import 'package:abc/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Ex extends StatelessWidget {
  const Ex({Key? key}) : super(key: key);
  Widget cats(
      {required ImageProvider image,
      required List<Color> gradeColor,
      required double font,
      required String label}) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50,
              child: Image(
                image: image,
              ),
            ),
          ),
          Positioned(
            left: 100,
            top: 40,
            child: Text(
              label,
              style:
                  GoogleFonts.arimaMadurai(color: Colors.white, fontSize: font),
            ),
          ),
        ],
      ),
      height: 100,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: gradeColor,
          ),
          boxShadow: const [
            BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 8),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final space = SizedBox(
      height: 10,
    );
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.transparent,
            ),
            margin: const EdgeInsets.only(left: 2, top: 0, bottom: 8),
            width: 200,
            height: 450,
            child: Container(
              child: ListView(
                /*   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start, */
                children: [
                  cats(
                      image: AssetImage('assets/love.png'),
                      gradeColor: [Colors.red, Colors.black],
                      font: 25,
                      label: "Love"),
                  space,
                  cats(
                      image: AssetImage('assets/friends.png'),
                      gradeColor: [Colors.lightBlueAccent, Colors.black],
                      font: 25,
                      label: 'Friends'),
                  space,
                  cats(
                      image: AssetImage('assets/comedy.png'),
                      gradeColor: [Colors.yellow, Colors.black],
                      font: 25,
                      label: 'Comedy'),
                  space,
                  cats(
                      image: AssetImage("assets/sad.png"),
                      gradeColor: [Colors.lightBlue, Colors.black],
                      font: 25,
                      label: 'Sad'),
                  space,
                  cats(
                      image: AssetImage('assets/tech.png'),
                      gradeColor: [Colors.lightGreen, Colors.black],
                      font: 25,
                      label: 'Tech')
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 450,
          width: 150,
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: InkWell(
                  onTap: () {
                    //  print("profiles");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => Profile()));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 10),
                      ],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/profile.jpg'),
                      ),
                    ),
                    height: 180,
                    width: 200,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 37,
                          bottom: 15,
                          child: Text(
                            "PROFILE",
                            style: GoogleFonts.breeSerif(
                                letterSpacing: 2,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Ser()));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 10),
                        ],
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/sup.png'))),
                    height: 180,
                    width: 200,
                    //
                    child: Stack(
                      children: [
                        Positioned(
                          left: 32,
                          bottom: 3,
                          child: Text(
                            "SERVICE",
                            style: GoogleFonts.breeSerif(
                                letterSpacing: 2,
                                backgroundColor: Colors.white,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    sureExit(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 10),
                        ],
                        image: const DecorationImage(
                            image: AssetImage('assets/logout.jpg'))),
                    height: 180,
                    width: 200,
                    //
                    child: Stack(
                      children: [
                        Positioned(
                          left: 38,
                          bottom: 10,
                          child: Container(
                            child: Text(
                              "LOGOUT",
                              style: GoogleFonts.breeSerif(
                                  letterSpacing: 2,
                                  color: Color(0xFFD50000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void sureExit(BuildContext context) async {
    return showDialog(
        context: (context),
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text("Exit"),
            content: Container(
              child: Text(
                  "Do you really want to exit from the app....??? Press OK to exit from the app....                        Press CANCEL for stay "),
            ),
            actions: [
              /* TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("CANCEL"),
              ), */
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("CANCEL"),
              ),
              ElevatedButton(
                  onPressed: () {
                    signOuts(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  void signOuts(BuildContext context) async {
    /* final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear(); */
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
