import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteDataSource {
  Future<FirebaseUser> signIn(String email, String password);
  Future<FirebaseUser> signUp(String email, String password);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<FirebaseUser> signIn(String email, String password) async {
    print("signing in");
    final auth = FirebaseAuth.instance;
    try {
      final authResult = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("user.uid: ${authResult.user.uid}");
      return authResult.user;
    } catch (err) {
      print("Error occured while signing in");
      print("error: $err");
      return null;
    }
  }

  @override
  Future<FirebaseUser> signUp(String email, String password) async {
    print("signing up");
    final auth = FirebaseAuth.instance;
    try {
      final authResult = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("user.uid: ${authResult.user.uid}");
      return authResult.user;
    } catch (err) {
      print("Error occured while signing in");
      print("error: $err");
      return null;
    }
  }
}
