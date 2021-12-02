// ignore_for_file: prefer_const_constructors, file_names

import 'package:abc/model/userModel.dart';
import 'package:abc/screens/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
//formkey
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //firstname
    final firstName = TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      validator: (value) {
        RegExp regex = RegExp(r'^.{5,}$');
        if (value!.isEmpty) {
          return ('Please enter your name');
        }
        if (!regex.hasMatch(value)) {
          return ("*Requiered Minimum 5 Characters");
        }
        return null;
      },
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        focusColor: Colors.red,
        fillColor: Colors.green,
        prefixIcon: Icon(Icons.account_circle, color: Colors.blue),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: '-----  Cena',
        helperText: 'Minimum 5 characters',
        labelText: 'FirstName',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.indigo, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      //validator
      onSaved: (value) {
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

//secondname
    final secondName = TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ('please enter name');
        }
        if (!regex.hasMatch(value)) {
          return ("firstname must have atleast 3");
        }
        return null;
      },
      autofocus: false,
      controller: secondNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.indigo, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.orange,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: 'jhone -----',
        labelText: 'SecondName',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      //validator
      onSaved: (value) {
        secondNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    //emailfield
    final email = TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ('Please enter email');
        }
        //rexexp for
        if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
          return ('please enter a valid email');
        }
        return null;
      },
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.indigo, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        prefixIcon: Icon(
          Icons.email,
          color: Colors.black,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: '@gmail.com',
        labelText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      //validator
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    //password

    final passwordField = TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ('please enter your password');
        }
        if (!regex.hasMatch(value)) {
          return ("enter valid password(Min.6 chracter)");
        }
      },
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.indigo, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      //validator
      onSaved: (value) {
        passwordController.text = value!;
      },

      textInputAction: TextInputAction.next,
    );
    final confirField = TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      validator: (value) {
        if (passwordController.text != confirmPassController.text) {
          return ('password not match');
        }
        return null;
      },
      autofocus: false,
      controller: confirmPassController,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.indigo, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        prefixIcon: Icon(
          Icons.vpn_lock,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: 'Confirm Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      //validator
      onSaved: (value) {
        confirmPassController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );
    //signup button

    final signupButton = ElevatedButton(
      child: const Text("Register"),
      onPressed: () {
        signUp(emailController.text, passwordController.text);
        print("signup pressed");
      },
    );

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                //color: Colors.green,
                child: Image(
                  height: 250,
                  width: 250,
                  image: AssetImage('assets/reg.png'),
                ),
              ),
              Expanded(
                //flex: 2,
                child: Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(25, 20)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 80,
                            blurRadius: 100,
                          )
                        ]),
                    padding:
                        const EdgeInsets.only(left: 36, right: 36, top: 15),
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10, top: 10, bottom: 20),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                            /*   mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center, */
                            children: [
                              firstName,
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              secondName,
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              email,
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              passwordField,
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              confirField,
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              Container(
                                  padding:
                                      EdgeInsets.only(left: 100, right: 100),
                                  child: signupButton),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account ?  login "),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "here",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFireStore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFireStore() async {
    //calling our fire store , //calling user mode class  , sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    //writing values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.secondName = secondNameController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account has been created");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => HomeScreen()), (route) => false);
  }
}
