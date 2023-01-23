import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/local_app_datasource.dart';
import '../datasources/remote_app_datasource.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final GalleryLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  // @override
  // Future<Either<Failure, List<ProductEntity>>> loadGalleryPosts() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final response = await remoteDataSource.loadGalleryPosts();
  //       localDataSource.cacheGalleryPosts(response);
  //       return Right(response);
  //     } catch (e) {
  //       if (e is SocketException) {
  //         return Left(SocketFailure());
  //       } else if (e is ServerException) {
  //         if (e.statusCode == 401) {
  //           return Left(UnauthorizedFailure());
  //         } else {
  //           return Left(
  //               ServerFailure(message: e.message, statusCode: e.statusCode));
  //         }
  //       } else {
  //         return Left(SocketFailure());
  //       }
  //     }
  //   } else {
  //     try {
  //       final response = await localDataSource.loadLastGalleryPosts();
  //       return Right(response);
  //     } on CacheException {
  //       return Left(CacheFailure());
  //     }
  //   }
  // }
}
