import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 3, blurRadius: 25)
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          gradient: LinearGradient(
              colors: [Colors.black, Colors.grey, Colors.grey, Colors.black]),
          image: DecorationImage(
            image: AssetImage('assets/lg.png'),
          ),
        ),
        height: 200,
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 144,
              child: Text(
                "Sanjanz",
                style: GoogleFonts.chicle(fontSize: 35, letterSpacing: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
