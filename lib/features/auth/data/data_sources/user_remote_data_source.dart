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
    final authResult = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("authResult.user: ${authResult.user}");
    return authResult.user;
  }

  @override
  Future<FirebaseUser> signUp(String email, String password) async {
    print("signing in");
    final auth = FirebaseAuth.instance;
    final authResult = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("authResult.user: ${authResult.user}");
    return authResult.user;
  }
}
