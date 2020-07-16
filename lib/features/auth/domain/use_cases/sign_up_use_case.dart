import 'package:firebase_auth/firebase_auth.dart';
import 'package:locus_optimus/core/use_case/use_case.dart';
import 'package:locus_optimus/features/auth/domain/repositories/user_repository.dart';

class SignUpUseCase implements UseCase<FirebaseUser, FirebaseUserParams> {
  final UserRepository repository;

  SignUpUseCase(this.repository);

  Future<FirebaseUser> call(FirebaseUserParams params) async {
    return await repository.signUp(params.email, params.password);
  }
}