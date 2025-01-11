import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speedo_life/Features/Main/presentation/cubits/buttom_navigation_cubit.dart';
import 'package:speedo_life/core/Network/connection_cubit.dart';

final sl = GetIt.instance;
final serviceLocator = sl;

Future<void> init() async {
  // initSplash();
  // initHome();

  sl.registerFactory<BottomNavigationCubit>(() => BottomNavigationCubit());

  //! Core
  // sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  // sl.registerLazySingleton<DioConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<ConnectionCubit>(() => ConnectionCubit());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => AppIntercepters());
  //هادا لطباعة اللوج
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));

  // sl.registerLazySingleton(() => Dio());

  //!################################ By Elgheny ############################

  //!################################ Package ###############################
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  //! ############################### Service ###############################
  /* serviceLocator.registerLazySingleton<FailureHandler>(() => FailureHandler());
  serviceLocator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  //! ################################ Datasources #################################

  serviceLocator.registerLazySingleton<DealsRemoteDatasource>(
      () => DealsRemoteDatasourceImpl());
  serviceLocator.registerLazySingleton<WalletRemoteDatasource>(
      () => WalletRemoteDatasourceImpl());
  serviceLocator.registerLazySingleton<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl());
  serviceLocator.registerLazySingleton<UpdateUserDataSource>(
      () => UpdateUserDataSourceImpl());
  serviceLocator.registerLazySingleton<MyFavouriteDataSource>(
      () => MyFavouriteDataSourceImpl());

  //! ################################# Repository #################################

  serviceLocator.registerLazySingleton<DealsRepo>(() => DealsRepoImpl());
  serviceLocator.registerLazySingleton<WalletRepo>(() => WalletRepoImpl());
  serviceLocator.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());
  serviceLocator
      .registerLazySingleton<UpdateUserRepo>(() => UpdateUserRepoImpl());
  serviceLocator.registerLazySingleton<MyFavouriteDealsRepo>(
      () => MyFavouriteDealsRepoImpl());
  //! ################################# Usecases #################################
  serviceLocator.registerLazySingleton(() => DealsUsecase());
  serviceLocator.registerLazySingleton(() => WalletUsecase());
  serviceLocator.registerLazySingleton(() => HomeUsecase());
  serviceLocator.registerLazySingleton(() => UpdateUserUseCase());
  serviceLocator.registerLazySingleton(() => MyFavouriteDealsUsecase());

  //! ############################### Bloc Or Cubit ###############################
  serviceLocator.registerFactory(() => DealsCubit());
  serviceLocator.registerSingleton(WalletCubit());
  serviceLocator.registerSingleton(HomeCubit());
  serviceLocator.registerSingleton(UserCubitCubit());
  serviceLocator.registerSingleton(FavouriteCubit()); */
}
