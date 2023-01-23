import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'core/bloc/session_bloc.dart';
import 'core/network/network_info.dart';
import 'features/template_app/presentation/bloc/home_page/home_page_cubit.dart';
import 'features/template_app/presentation/bloc/view_product_card_details_page/view_product_card_details_page_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  /// BLoCs
  /// TODO: add BloCs to 'injection_container'
  sl.registerLazySingleton<SessionBloc>(() => SessionBloc());
  sl.registerFactory<HomePageCubit>(
      () => HomePageCubit(loadPostsUseCase: sl()));
  sl.registerFactory<DestinationPageCubit>(() => DestinationPageCubit());

  /// Use-cases
  /// TODO: add use-cases to 'injection_container'
  // sl.registerFactory<LoadGalleryPostsUseCase>(
  //     () => LoadGalleryPostsUseCase(sl()));

  /// Repositories
  /// TODO: add repositories to 'injection_container'
  // sl.registerLazySingleton<GalleryRepository>(() => GalleryRepositoryImpl(
  //     remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  /// Data sources
  /// TODO: add  remote and local data sources to 'injection_container'
  // sl.registerLazySingleton<GalleryRemoteDataSource>(
  //     () => GalleryRemoteDataSourceImpl(localDataSource: sl()));
  // sl.registerLazySingleton<GalleryLocalDataSource>(
  //     () => GalleryLocalDataSourceImpl());

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  sl.registerLazySingleton<GlobalKey<NavigatorState>>(() => navigatorKey);
  // sl.registerLazySingleton<FirebaseMessagingService>(
  //         () => FirebaseMessagingService(localDatasource: sl()));
}
