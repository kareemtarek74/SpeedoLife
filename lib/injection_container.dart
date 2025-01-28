import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speedo_life/Features/Home/Data/DataSource/home_local_data_source.dart';
import 'package:speedo_life/Features/Home/Data/DataSource/home_remote_data_source.dart';
import 'package:speedo_life/Features/Home/Data/Repos/home_repo_impl.dart';
import 'package:speedo_life/Features/Home/Domain/Repos/home_repo.dart';
import 'package:speedo_life/Features/Home/Domain/useCases/home_usecase.dart';
import 'package:speedo_life/Features/Home/presentation/cubits/Home%20Cubit/home_cubit.dart';
import 'package:speedo_life/Features/Main/presentation/cubits/buttom_navigation_cubit.dart';
import 'package:speedo_life/Features/Sections/data/DataSources/categories_data_source.dart';
import 'package:speedo_life/Features/Sections/data/DataSources/categories_local_data_source.dart';
import 'package:speedo_life/Features/Sections/data/Repos/categories_repo_impl.dart';
import 'package:speedo_life/Features/Sections/domain/Repos/categories_repo.dart';
import 'package:speedo_life/Features/Sections/domain/usecases/categories_usecase.dart';
import 'package:speedo_life/Features/Sections/presentation/cubits/cubit/categories_cubit.dart';
import 'package:speedo_life/core/Api/failure_handler.dart';
import 'package:speedo_life/core/Api/http_service.dart';
import 'package:speedo_life/core/Api/http_service_impl.dart';
import 'package:speedo_life/core/Network/connection_cubit.dart';

final sl = GetIt.instance;
final serviceLocator = sl;

BaseOptions _dioOptions() {
  return BaseOptions(
    baseUrl: 'http://209.250.237.58:5031/api', // Base URL
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
    sendTimeout: const Duration(seconds: 50),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    validateStatus: (status) {
      return status != null && status <= 500;
    },
  );
}

Future<void> init() async {
  sl.registerFactory<BottomNavigationCubit>(() => BottomNavigationCubit());

  //! Core
  sl.registerLazySingleton<ConnectionCubit>(() => ConnectionCubit());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));

  if (!serviceLocator.isRegistered<Dio>()) {
    serviceLocator.registerLazySingleton<Dio>(() => Dio(_dioOptions()));
  }

  //! ############################### Service ###############################
  serviceLocator.registerLazySingleton<FailureHandler>(() => FailureHandler());
  serviceLocator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  //! ################################ Datasources #################################

  serviceLocator
      .registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(sl()));

  serviceLocator.registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl());
  sl.registerLazySingleton<CategoriesLocalDataSource>(
      () => CategoriesLocalDataSourceImpl(sl()));

  //! ################################# Repository #################################

  serviceLocator
      .registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());

  serviceLocator.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl());

  //! ################################# Usecases #################################
  serviceLocator.registerLazySingleton(() => FetchHomeDataUseCase());

  serviceLocator.registerLazySingleton(() => FetchCategoriesUseCase());

  //! ############################### Bloc Or Cubit ###############################
  serviceLocator.registerFactory(() => HomeCubit());
  serviceLocator.registerFactory(() => CategoriesCubit());
}
