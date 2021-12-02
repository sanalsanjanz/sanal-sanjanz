// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:abc/model/userModel.dart';
import 'package:abc/screens/loginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) => this.loggedInUser = UserModel.fromMap(value.data()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        top: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/profile.jpg'),
                      ),
                    ),
                    Text(
                      "${loggedInUser.firstName}".toUpperCase(),
                      style: GoogleFonts.abrilFatface(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              /*  Container(
                height: 200,
                //color: Colors.red,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    image:
                        DecorationImage(image: AssetImage('assets/tech.png'))),
              ), */
              /* Text("${loggedInUser.firstName}") */

              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  padding: EdgeInsets.all(3),
                  color: Colors.white,
                  height: 200,
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'N',
                              style: GoogleFonts.adventPro(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            TextSpan(
                              text: "AME : ",
                              style: GoogleFonts.adventPro(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            TextSpan(
                              text: "${loggedInUser.firstName}  ".toUpperCase(),
                              style: GoogleFonts.capriola(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                            TextSpan(
                              text: "${loggedInUser.secondName}".toUpperCase(),
                              style: GoogleFonts.capriola(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Email :  ${loggedInUser.email}",
                        style: GoogleFonts.capriola(
                            color: Colors.blueGrey, fontSize: 18),
                      ),
                      Text(
                        "User Id : ${loggedInUser.uid}",
                        style: GoogleFonts.capriola(
                            color: Colors.blueGrey, fontSize: 18),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Back"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
