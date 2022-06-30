import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/screens/home_trips.dart';
import 'package:platzi_trips_app/Place/ui/screens/search_trips.dart';
import 'package:platzi_trips_app/User/ui/screens/profile_trips.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _PlatziTrips();
  }

}

class _PlatziTrips extends State<PlatziTrips> {
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips()
  ];
  int indexTap = 0;
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple,
        ),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }

}