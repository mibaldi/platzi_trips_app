import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  late UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }
  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(title: "", height: double.infinity),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome \n This is your Travel App",
                  style:
                  TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  )
              ),
              ButtonGreen(
                text: "Login with gmail",
                width: 300.0,
                height: 50.0,
                onPressed: () {
                  userBloc.signIn().then((user) {
                    if (user != null) {
                      String displayName = user.displayName != null ? "${user.displayName}" : "";
                      String email = user.email != null ? "${user.email}" : "";
                      String photoURL = user.photoURL != null ? "${user.photoURL}" : "";
                      userBloc.updateUserData(UserAppModel(uid: user.uid, name: displayName , email: email, photoURL: photoURL));
                      print("Signed in ${user.displayName}");
                    }
                  });
                },
              ),
              ],
          ),
        ],
      ),
    );
  }
}