import 'package:flutter/material.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class FirebaseUserParams {
  final String email;
  final String password;
  
  FirebaseUserParams({
    @required this.email,
    @required this.password,
  });
}
