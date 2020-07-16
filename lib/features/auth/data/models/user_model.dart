import 'package:locus_optimus/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

class UserModel extends User {
  final String email;
  final String password;

  UserModel({
    @required this.email,
    this.password,
  }) : super(email: email);
}