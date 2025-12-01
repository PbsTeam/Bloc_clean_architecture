import 'package:bloc_clean_architecture/presentation/viewmodel/theme_viewmodel/theme_bloc.dart';
import 'package:bloc_clean_architecture/presentation/viewmodel/theme_viewmodel/theme_viewmodel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'config/components/app_storage.dart';
import 'core/api/network_service.dart';
import 'data/datasources/remote/login_remote_datasource.dart';
import 'data/datasources/remote/movies_remote_datasource.dart';
import 'data/repositories_impl/login_repository_impl.dart';
import 'data/repositories_impl/movies_repository_impl.dart';
import 'domain/repositories/login_repository.dart';
import 'domain/repositories/movies_repository.dart';
import 'domain/usecases/get_movies_usecases.dart';
import 'domain/usecases/login_usecases.dart';
import 'presentation/viewmodel/localization_viewmodel/localization_bloc.dart';

GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<AppStorage>(() => AppStorage());
  getIt.registerLazySingleton<NetworkApiService>(() => NetworkApiService());

  ///Login
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt.get<LoginRepository>()),
  );

  ///Movies

  getIt.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl());
  getIt.registerLazySingleton<GetMoviesUseCase>(
    () => GetMoviesUseCase(getIt.get<MoviesRepository>()),
  );

  ///Localization
  getIt.registerLazySingleton(() => LocalizationBloc());

  ///Theme
  getIt.registerLazySingleton(() => ThemeBloc());
  /// ViewModel
  getIt.registerLazySingleton<ThemeViewModel>(
        () => ThemeViewModel(getIt<ThemeBloc>()),
  );


}
