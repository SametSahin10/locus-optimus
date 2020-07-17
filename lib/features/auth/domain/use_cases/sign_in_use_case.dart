import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/use_case/use_case.dart';
import '../repositories/user_repository.dart';

class SignInUseCase implements UseCase<FirebaseUser, FirebaseUserParams> {
  final UserRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<FirebaseUser> call(FirebaseUserParams params) async {
    return await repository.signIn(params.email, params.password);
  }
}
