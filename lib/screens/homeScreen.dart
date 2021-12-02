// ignore_for_file: file_names, unnecessary_this, constant_identifier_names

import 'package:abc/homeProps/aboutPage.dart';
import 'package:abc/homeProps/carousal.dart';
import 'package:abc/homeProps/ex.dart';

import 'package:abc/model/userModel.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const Carousel(),
          const Ex(),
          InkWell(
            onTap: () {
              print('abbbbb');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutPage()));
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 130,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/about.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
