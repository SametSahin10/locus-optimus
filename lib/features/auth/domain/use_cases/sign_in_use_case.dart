import 'package:firebase_auth/firebase_auth.dart';
import 'package:locus_optimus/core/use_case/use_case.dart';
import 'package:locus_optimus/features/auth/domain/repositories/user_repository.dart';

class SignInUseCase implements UseCase<FirebaseUser, FirebaseUserParams> {
  final UserRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<FirebaseUser> call(FirebaseUserParams params) async {
    return await repository.signIn(params.email, params.password);
  }
}
