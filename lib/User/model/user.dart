import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';

class UserAppModel {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Place>? myFavoritePlaces;
  final List<Place>? myPlaces;

  UserAppModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
    this.myPlaces,
    this.myFavoritePlaces
  });
}