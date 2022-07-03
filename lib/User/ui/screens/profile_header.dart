import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/widgets/button_bar.dart';
import 'package:platzi_trips_app/User/widgets/user_info.dart';


class ProfileHeader extends StatelessWidget {
  late UserBloc userBloc;
  late UserAppModel user;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
              return showProfileData(snapshot);

          }
        },
        stream: userBloc.streamFirebase);
    /**/

  }
  Widget showProfileData(AsyncSnapshot snapshot){
    if (!snapshot.hasData ||snapshot.hasError){
      print("no logado");
      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la información"),
          ],
        ),
      );
    } else {
      print("Logado");
      print(snapshot.data);
      user = UserAppModel(name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL, uid: '');
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        ),
      );

      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title
              ],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}