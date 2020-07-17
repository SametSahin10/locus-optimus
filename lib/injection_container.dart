import 'package:get_it/get_it.dart';

import 'features/auth/data/data_sources/user_remote_data_source.dart';
import 'features/auth/data/repositories/user_repository_impl.dart';
import 'features/auth/domain/repositories/user_repository.dart';
import 'features/auth/domain/use_cases/sign_in_use_case.dart';
import 'features/auth/domain/use_cases/sign_up_use_case.dart';

final sl = GetIt.instance;

void init() async {
  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );
}
