import 'package:dio/dio.dart';

import 'local_app_datasource.dart';

abstract class RemoteDataSource {
  /// TODO: Change endpoint link
  /// Calls the https://api.unsplash.com/photos endpoint
  ///
  /// Throws a [ServerException], [SocketException] for all error codes
  /// TODO: add remote functions
  /// Future<List<PostModel>> loadGalleryPosts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final GalleryLocalDataSource localDataSource;

  RemoteDataSourceImpl({required this.localDataSource});

  Dio init() {
    Dio dio = Dio();
    return dio;
  }

  /// Loading data from API code example
  // @override
  // Future<List<PostModel>> loadGalleryPosts() async {
  //   final dio = init();
  //   try {
  //     final response = await dio.get("API_LINK");
  //     return (response.data as List<dynamic>).map((i) {
  //       return PostModel.fromJson(i);
  //     }).toList();
  //   } on DioError catch (e) {
  //     if (DioErrorType.receiveTimeout == e.type ||
  //         DioErrorType.connectTimeout == e.type) {
  //       throw SocketException();
  //     } else if (e.message.contains('SocketException')) {
  //       throw SocketException();
  //     } else {
  //       if (e.response?.statusCode == 401 &&
  //           e.response?.data != 'Unauthorized!') {
  //         throw ServerException(message: e.response!.data, statusCode: 401);
  //       } else if (e.response?.data == 'Unauthorized!') {
  //         throw ServerException(message: e.response!.data, statusCode: 403);
  //       } else {
  //         throw ServerException(message: 'Unknown error', statusCode: 404);
  //       }
  //     }
  //   }
  // }
}
