import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/use_case/use_case.dart';
import '../repositories/user_repository.dart';

class SignUpUseCase implements UseCase<FirebaseUser, FirebaseUserParams> {
  final UserRepository repository;

  SignUpUseCase(this.repository);

  Future<FirebaseUser> call(FirebaseUserParams params) async {
    return await repository.signUp(params.email, params.password);
  }
}