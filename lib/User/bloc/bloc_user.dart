import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class UserBloc implements Bloc {

  final authRepository = AuthRepository();

  //Flujo de datos -Streams
  //Stram - Firebase
  //StreamController;
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  //Casos uso
  //1. SignIn a la aplicacion Google
  Future<User?> signIn() {
    return authRepository.signIn();
  }
  signOut() {
    authRepository.signOut();
  }
  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(UserAppModel user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  @override
  void dispose() {
  }
}