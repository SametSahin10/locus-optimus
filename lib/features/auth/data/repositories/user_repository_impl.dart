import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/user_repository.dart';
import '../data_sources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    @required this.remoteDataSource,
  });

  @override
  Future<FirebaseUser> signIn(String email, String password) async {
    return await remoteDataSource.signIn(email, password);
  }

  @override
  Future<FirebaseUser> signUp(String email, String password) async {
    return await remoteDataSource.signUp(email, password);
  }
}
