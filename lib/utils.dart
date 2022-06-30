import  'package:flutter/material.dart';


Widget star(bool withBorder,double topParam){
  return Container(
    margin: EdgeInsets.only(top: topParam, right: 3),
    child: Icon (
      withBorder ? Icons.star : Icons.star_border,
      color: Colors.amber,
    ),
  );
}

Widget showStars(int numberStars, double topParam){
  List<Widget> rowStars = [];
  List<Widget> rowStarsBorder = [];
  List.filled(numberStars, null, growable: false).forEach((i) => rowStars.add(star(true,topParam)));
  List.filled((numberStars - 5).abs(), null, growable: false).forEach((i) => rowStarsBorder.add(star(false,topParam)));
  List<Widget> finalStars = []..addAll(rowStars)..addAll(rowStarsBorder);
  return Row(
    children: finalStars,
  );
}

final star_half = Container(
  margin: const EdgeInsets.only(
    top: 323,
    right: 3,
  ),
  child: const Icon(
    Icons.star_half,
    color: Color(0xFFf2C611),
  ),
);
