// ignore_for_file: file_names

import 'package:abc/screens/loginScreen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Catogory

        Column(
          children: [
            Container(
              height: 500,
              width: 250,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // profie
                InkWell(
                  onTap: () {
                    print("profiles");
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 10),
                      ],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/profiles.png'),
                      ),
                    ),
                    height: 160,
                    width: 200,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 23,
                          bottom: 8,
                          child: Container(
                            child: const Text(
                              "PROFILE",
                              style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //logout
                InkWell(
                  onTap: () {
                    print("LOGOUT");
                    sureExit(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 10),
                        ],
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/logout.png'))),
                    height: 160,
                    width: 200,
                    //
                    child: Stack(
                      children: const [
                        Positioned(
                          left: 27,
                          bottom: 3,
                          child: Text(
                            "LOGOUT",
                            style: TextStyle(
                                letterSpacing: 2,
                                backgroundColor: Colors.white,
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    print("service");
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 10),
                        ],
                        image: const DecorationImage(
                            image: AssetImage('assets/sup.png'))),
                    height: 160,
                    width: 200,
                    //
                    child: Stack(
                      children: [
                        Positioned(
                          left: 25,
                          bottom: 10,
                          child: Container(
                            child: const Text(
                              "SERVICE",
                              style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
            backgroundColor: Colors.red[10],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text("Exit"),
            content: SizedBox(
              height: 100,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Do you really want to exit from the app "),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Press OK to exit"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Press CANCEL for stay")
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("CANCEL"),
              ),
              TextButton(
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
