import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool fav = false;

  void onPressedFav(){
    setState(() {
        fav = !fav;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 500),
        content:  fav ? Text("Agregaste a Favoritos"): Text("Eliminaste de Favoritos"),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Favoritos",
      child: fav ? Icon(Icons.favorite): Icon(Icons.favorite_border),
      onPressed: onPressedFav,
    );
  }
}