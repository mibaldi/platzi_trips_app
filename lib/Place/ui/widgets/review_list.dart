import 'package:flutter/material.dart';

import 'review.dart';

class ReviewList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review.withData(),
        Review.withData(),
        Review.withData(),
        Review.withData(),
        Review.withData(),
      ],
    );
  }
}