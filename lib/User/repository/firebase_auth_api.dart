import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class FirebaseAuthAPI {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signIn() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final User? user = (await auth.signInWithCredential(credential)).user;
      return user;
    } else {
      print("Error");
      return null;
    }

  }
  signOut() async {
    await auth.signOut().then((value) => print("Sesión Cerrada"));
    await googleSignIn.signOut();
    print("Sesiones cerradas");
  }
}