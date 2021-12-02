// ignore_for_file: prefer_const_literals_to_create_immutables, file_names

import 'package:abc/homeProps/facebook.dart';
import 'package:abc/instagram.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  Widget social(
      {required ImageProvider<Object> image,
      required String name,
      required List<Color> colours}) {
    return Container(
      /*  margin: EdgeInsets.all(8),*/
      padding: const EdgeInsets.all(5),
      height: 50,
      width: 200,
      decoration: BoxDecoration(gradient: LinearGradient(colors: colours)),
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Positioned(
            child: Image(
              image: image,
            ),
          ),
          Positioned(
            left: 60,
            top: 5,
            right: 10,
            child: Text(
              name,
              style:
                  GoogleFonts.dancingScript(color: Colors.white, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      body: Center(
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(36),
            color: Colors.white54,
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width * .9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(
                      width: 250,
                      image: AssetImage('assets/me.jpeg'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Instagram()));
                    },
                    child: social(
                      colours: [Colors.black, Colors.indigo, Colors.black],
                      image: const AssetImage('assets/insta.png'),
                      name: 'Instagram ',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: social(
                        image: const AssetImage("assets/whatsapp.png"),
                        name: 'Whatsapp',
                        colours: [Colors.blue, Colors.black]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FaceBook()));
                    },
                    child: social(
                        image: const AssetImage("assets/facebook.png"),
                        name: 'FaceBook',
                        colours: [Colors.blue, Colors.black]),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Back"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
