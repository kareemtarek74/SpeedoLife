import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speedo_life/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:speedo_life/Features/Auth/domain/Repos/auth_repo.dart';
import 'package:speedo_life/Features/Auth/domain/UseCases/auth_usecase.dart';
import 'package:speedo_life/Features/Auth/presentation/cubits/SignIn/sign_in_cubit.dart';
import 'package:speedo_life/Features/Auth/presentation/cubits/SignUp/sign_up_cubit.dart';
import 'package:speedo_life/Features/Favourite/User/data/Repos/user_repo_impl.dart';
import 'package:speedo_life/Features/Favourite/User/data/datasource/user_local_data_source.dart';
import 'package:speedo_life/Features/Favourite/User/data/datasource/user_remote_data_source.dart';
import 'package:speedo_life/Features/Favourite/User/domain/Repos/user_repo.dart';
import 'package:speedo_life/Features/Favourite/User/domain/usecases/user_usecases.dart';
import 'package:speedo_life/Features/Favourite/User/presentation/cubits/cubit/user_info_cubit.dart';
import 'package:speedo_life/Features/Home/Data/DataSource/home_local_data_source.dart';
import 'package:speedo_life/Features/Home/Data/DataSource/home_remote_data_source.dart';
import 'package:speedo_life/Features/Home/Data/Repos/home_repo_impl.dart';
import 'package:speedo_life/Features/Home/Domain/Repos/home_repo.dart';
import 'package:speedo_life/Features/Home/Domain/useCases/home_usecase.dart';
import 'package:speedo_life/Features/Home/presentation/cubits/Home%20Cubit/home_cubit.dart';
import 'package:speedo_life/Features/Main/presentation/cubits/buttom_navigation_cubit.dart';
import 'package:speedo_life/Features/Offers/Data/datasources/offer_categories_local_data_source.dart';
import 'package:speedo_life/Features/Offers/Data/datasources/offer_categories_remote_datasource.dart';
import 'package:speedo_life/Features/Offers/Data/datasources/offer_products_remote_datasource.dart';
import 'package:speedo_life/Features/Offers/Data/datasources/offers_local_datasource.dart';
import 'package:speedo_life/Features/Offers/Data/datasources/offers_remote_datasouce.dart';
import 'package:speedo_life/Features/Offers/Data/repos/offer_categories_repo_impl.dart';
import 'package:speedo_life/Features/Offers/Data/repos/offer_products_repo_impl.dart';
import 'package:speedo_life/Features/Offers/Data/repos/offers_repo_impl.dart';
import 'package:speedo_life/Features/Offers/Domain/repos/offer_categories_repo.dart';
import 'package:speedo_life/Features/Offers/Domain/repos/offer_products_repo.dart';
import 'package:speedo_life/Features/Offers/Domain/repos/offers_repo.dart';
import 'package:speedo_life/Features/Offers/Domain/usecases/offer_categories_usecase.dart';
import 'package:speedo_life/Features/Offers/Domain/usecases/offer_products_usecase.dart';
import 'package:speedo_life/Features/Offers/Domain/usecases/offers_usecase.dart';
import 'package:speedo_life/Features/Offers/Presentation/cubits/Offer%20Products/offer_products_cubit.dart';
import 'package:speedo_life/Features/Offers/Presentation/cubits/Offer%20categories%20cubit/offer_categories_cubit.dart';
import 'package:speedo_life/Features/Offers/Presentation/cubits/Offers%20Cubit/offers_cubit.dart';
import 'package:speedo_life/Features/Sections/data/DataSources/categories_data_source.dart';
import 'package:speedo_life/Features/Sections/data/DataSources/categories_local_data_source.dart';
import 'package:speedo_life/Features/Sections/data/DataSources/products_data_source.dart';
import 'package:speedo_life/Features/Sections/data/DataSources/products_local_data_source.dart';
import 'package:speedo_life/Features/Sections/data/Repos/categories_repo_impl.dart';
import 'package:speedo_life/Features/Sections/data/Repos/products_repo_impl.dart';
import 'package:speedo_life/Features/Sections/domain/Repos/categories_repo.dart';
import 'package:speedo_life/Features/Sections/domain/Repos/products_repo.dart';
import 'package:speedo_life/Features/Sections/domain/usecases/categories_usecase.dart';
import 'package:speedo_life/Features/Sections/domain/usecases/products_usecase.dart';
import 'package:speedo_life/Features/Sections/presentation/cubits/Categories%20cubit/categories_cubit.dart';
import 'package:speedo_life/Features/Sections/presentation/cubits/Products%20Cubit/products_cubit.dart';
import 'package:speedo_life/core/Api/failure_handler.dart';
import 'package:speedo_life/core/Api/http_service.dart';
import 'package:speedo_life/core/Api/http_service_impl.dart';
import 'package:speedo_life/core/Network/connection_cubit.dart';
import 'package:speedo_life/core/services/firebase_auth_services.dart';

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
  serviceLocator.registerLazySingleton<FirebaseAuthServices>(
      () => FirebaseAuthServices());

  //! ################################ Datasources #################################

  serviceLocator
      .registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(sl()));

  serviceLocator.registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl());
  sl.registerLazySingleton<CategoriesLocalDataSource>(
      () => CategoriesLocalDataSourceImpl(sl()));

  serviceLocator.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl());
  sl.registerLazySingleton<ProductsLocalDataSource>(
      () => ProductsLocalDataSourceImpl(sl()));
  serviceLocator.registerLazySingleton<OffersRemoteDataSource>(
      () => OffersRemoteDataSourceImpl());
  sl.registerLazySingleton<OffersLocalDataSource>(
      () => OffersLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<OfferCategoriesRemoteDataSource>(
      () => OfferCategoriesRemoteDataSourceImpl());
  sl.registerLazySingleton<OfferCategoriesLocalDataSource>(
      () => OfferCategoriesLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<OfferProductsRemoteDatasource>(
      () => OfferProductsRemoteDataSourceImpl());

  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl());

  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sl()));

  //! ################################# Repository #################################

  serviceLocator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());

  serviceLocator
      .registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());

  serviceLocator.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl());

  serviceLocator.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl());
  serviceLocator
      .registerLazySingleton<OffersRepo>(() => OffersRepositoryImpl());
  serviceLocator.registerLazySingleton<OfferCategoriesRepo>(
      () => OfferCategoriesRepositoryImpl());

  serviceLocator
      .registerLazySingleton<OfferProductsRepo>(() => OfferProductsRepoImpl());

  serviceLocator.registerLazySingleton<UserRepo>(() => UserRepositoryImpl());

  //! ################################# Usecases #################################
  serviceLocator.registerLazySingleton(() => FetchAuthUseCase());

  serviceLocator.registerLazySingleton(() => FetchHomeDataUseCase());

  serviceLocator.registerLazySingleton(() => FetchCategoriesUseCase());

  serviceLocator.registerLazySingleton(() => FetchProductsUseCase());
  serviceLocator.registerLazySingleton(() => FetchOffersUseCase());
  serviceLocator.registerLazySingleton(() => FetchOfferCategoriesUseCase());

  serviceLocator.registerLazySingleton(() => FetchOfferProductsUseCase());

  serviceLocator.registerLazySingleton(() => FetchUserInfoUseCase());

  //! ############################### Bloc Or Cubit ###############################
  serviceLocator.registerFactory(() => SignUpCubit());
  serviceLocator.registerFactory(() => SignInCubit());
  serviceLocator.registerFactory(() => HomeCubit());
  serviceLocator.registerFactory(() => CategoriesCubit());
  serviceLocator.registerFactory(() => ProductsCubit());
  serviceLocator.registerFactory(() => OffersCubit());
  serviceLocator.registerFactory(() => OfferCategoriesCubit());
  serviceLocator.registerFactory(() => OfferProductsCubit());
  serviceLocator.registerFactory(() => UserInfoCubit());
}
