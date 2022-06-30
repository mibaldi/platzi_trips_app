import  'package:flutter/material.dart';


class GradientBack extends StatelessWidget {
  String title = "Popular";
  double height = 250.0;

  GradientBack({required String title, double height = 250.0}){
    this.title = title;
    this.height = height;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp,
          colors: [
            Color(0xFF3383CD),
            Color(0xFF11249F),
          ],
        ),
      ),
      alignment: const Alignment(-0.9, -0.6),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}