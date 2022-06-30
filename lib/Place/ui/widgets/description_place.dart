import 'package:flutter/material.dart';
import 'package:platzi_trips_app/utils.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(
    this.namePlace,
    this.stars,
    this.descriptionPlace,
  );
  @override
  Widget build(BuildContext context) {

    final description = Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Text(
        descriptionPlace,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
    final titleStars = Row (
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            top: 320,
            left: 20,
            right: 20,
          ),child:  Text(
            namePlace,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          textAlign: TextAlign.left,
          ),
        ),
        showStars(5, 320),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleStars,
        description,
        ButtonPurple("Navigate"),
      ],
    );
  }


}