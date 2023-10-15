import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> slInit() async {
  await sl.reset();

  //_initRepositories();
  //_initServices();
}

Future<void> diDispose() => sl.reset();

// void _initRepositories() {
//   sl
//     ..registerFactory<AuthRepository>(
//       () => AuthRepositoryImpl(networkClient: sl.get<NetworkClient>()),
//     )
//     ..registerFactory<UserRepository>(
//       () => UserRepositoryImpl(networkClient: sl.get<NetworkClient>()),
//     );
// }

// void _initServices() {
//   sl
//     ..registerLazySingleton<AuthService>(
//       () => AuthService(
//         authRepository: sl.get<AuthRepository>(),
//         tokensPersistence: sl.get<TokensPersistence>(),
//       ),
//     )
//     ..registerLazySingleton<UserService>(
//       () => UserService(
//         userRepository: sl.get<UserRepository>(),
//       ),
//     );
// }
