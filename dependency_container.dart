import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sb_myreports/features/authentication/login/data/data_sources/login_remote_data_source.dart';
import 'package:sb_myreports/features/authentication/login/data/repository/auth_repo_imp.dart';
import 'package:sb_myreports/features/authentication/login/domain/repository/auth_repo.dart';
import 'package:sb_myreports/features/authentication/login/domain/usecases/login_usecase.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';

import 'core/router/app_state.dart';
import 'core/utils/globals/globals.dart';
import 'core/utils/network/network_info.dart';

Future<void> init() async {
  /// UseCases
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  //Repositories
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(dio: sl()));

  //Data sources
  sl.registerLazySingleton<AuthRepository>(
      () => LoginRepoImp(networkInfo: sl(), remoteDataSource: sl()));

  /// Configs

  /// Repository

  /// External
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// Providers
  ///
  sl.registerLazySingleton(() => AuthProvider(sl()));

  /// Navigator
  sl.registerLazySingleton(() => AppState());
}
