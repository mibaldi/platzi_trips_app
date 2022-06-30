import 'package:flutter/material.dart';

import '../../../utils.dart';
class Review extends StatelessWidget {
  String pathImage = "assets/images/luffyg5.jpg";
  String name = "Luffy";
  String details = "1 review 5 photos";
  String comment = "This is a good place";

  Review(this.pathImage,this.name,this.details,this.comment);
  Review.withData():pathImage = "assets/images/luffyg5.jpg",name = "Luffy",details = "1 review 5 photos",comment = "This is a good place";
  @override
  Widget build(BuildContext context) {

    final userComment = Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10
      ),
      child: Text(
        comment,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
    final userInfo = Container(
      margin: const EdgeInsets.only(
        left: 20,
      ),
      child: Row(
        children: <Widget>[
          Text(
            details,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFFa3a5a7),
            ),
          ),
          showStars(5,0),
        ],
      ),
    );
    final userName = Container(
      margin: const EdgeInsets.only(
        left: 20,
        bottom: 5,
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        // ignore: prefer_const_constructors
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w900,
          color: Colors.black26,
        ),
      ),
    );
    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        userName,
        userInfo,
        userComment
      ],
    );
    final photo = Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
      ),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage),
        ),
      ),
    );


    return Container(margin: const EdgeInsets.only(top:20),
       child: Row(
        children: [
          photo,
          userDetails
        ],
      )
    );
  }

}