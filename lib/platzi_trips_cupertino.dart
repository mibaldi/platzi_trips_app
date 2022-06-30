import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Place/ui/screens/home_trips.dart';
import 'User/ui/screens/profile_trips.dart';
import 'Place/ui/screens/search_trips.dart';


class PlatziTripsCupertino extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlatziTripsCupertino();
  }
}

class _PlatziTripsCupertino extends State<PlatziTripsCupertino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white.withAlpha(70),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => ProfileTrips(),
              );
            default:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
          }
        },
      ),
    );
  }

}